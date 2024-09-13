import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loader/loaders.dart';
import 'package:t_store/data/repositories/recipe/addrecipe_ingredients_repository.dart';
import 'package:t_store/data/repositories/recipe/reviews_ratings_repository.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/recepie/models/recipe_review_rating_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

class ReviewsRatingsController extends GetxController {
  static ReviewsRatingsController get instance => Get.find();
  final controller = Get.put(UserController());
  var isLoading = false.obs;

  final reviewController = TextEditingController();
  final ratingController = TextEditingController();
  var recipeId = ''.obs;
  GlobalKey<FormState> reviewRatingFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final reviewRatingRepository = Get.put(ReviewsRatingsRepository());
  final addRecipeIngredientRepository = Get.put(AddIngredientsRepository());

  /// Fetch all user specific addresses
  Future<List<RecipeReviewRatingModel>> getAllUserReviews(String id) async {
    try {
      recipeId.value = id;
      final reviews = await reviewRatingRepository.fetchUserReviews(recipeId.value);
      return reviews;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  /// Add new Address
  Future addReviewsRatings() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Starting Address...', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!reviewRatingFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save Address Data
      final reviewRating = RecipeReviewRatingModel(
        id: '',
        rating: double.parse(ratingController.text.trim()),
        review: reviewController.text.trim(),
        username: controller.user.value.username,
      );
      print('Ok');
      await reviewRatingRepository.addReviewRating(reviewRating, recipeId.value);
      updateRatings(recipeId.value);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your address has been saved successfully.');

      // Refresh Addresses Data
      refreshData.toggle();

      // Reset fields
      resetFormFields();

      // Redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
    }
  }

  /// Fetch all user specific addresses
  void updateRatings(String id) async {
    try {
      recipeId.value = id;
      final reviews = await reviewRatingRepository.fetchUserReviews(recipeId.value);
      double avgRatings=0;
      for(int i=0;i<reviews.length;i++){
        avgRatings+=reviews[i].rating;
      }
      avgRatings=avgRatings/reviews.length;
      await addRecipeIngredientRepository.updateRatings(recipeId.value, avgRatings);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
    }
  }

  /// Function to reset form fields
  void resetFormFields() {
    ratingController.clear();
    reviewController.clear();
  }
}
