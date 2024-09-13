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

import '../../../data/repositories/notifications/notifications_repository.dart';
import '../models/notifications_model.dart';

class NotificationsController extends GetxController {
  static NotificationsController get instance => Get.find();
  final controller = Get.put(UserController());
  var isLoading = false.obs;

  var userId = ''.obs;
  GlobalKey<FormState> reviewRatingFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final notificationsRepository = Get.put(NotificationsRepository());
  // final addRecipeIngredientRepository = Get.put(AddIngredientsRepository());

  /// Fetch all user specific addresses
  Future<List<NotificationsModel>> getAllNotificationsOfUser(String id) async {
    try {
      userId.value = id;
      final notifications = await notificationsRepository.fetchNotificationsOfUser(userId.value);
      return notifications;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  /// Fetch all user specific addresses
  Future<List<NotificationsModel>> getUnreadNotificationsOfUser(String id) async {
    try {
      userId.value = id;
      final notifications = await notificationsRepository.fetchUnreadNotificationsOfUser(userId.value);
      return notifications;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  /// Add new Address
  /*Future addReviewsRatings() async {
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
      // updateRatings(recipeId.value);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your address has been saved successfully.');

      // Refresh Addresses Data
      refreshData.toggle();

      // Reset fields
      // resetFormFields();

      // Redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
    }
  }*/
}
