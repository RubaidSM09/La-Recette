import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/recepie/models/addrecipe_ingredients_model.dart';
import 'package:t_store/lib/data/repositories/recipe/add_ingredients_repository.dart';
import 'package:t_store/data/repositories/recipe/addrecipe_ingredients_repository.dart';
class AddIngredientsController extends GetxController {
  final AddIngredientsRepository _repository = AddIngredientsRepository();
  final controller = Get.put(UserController());

  var recipeId = ''.obs;
  var recipeName = ''.obs;
  var chefName = ''.obs;
  var cookingTimeHours = ''.obs;
  var cookingTimeMinutes = ''.obs;
  var rating = 0.00.obs;
  var servings = 0.obs;
  var category = ''.obs;
  var description = ''.obs;
  var ingredients = <RecipeIngredientModel>[].obs;
  var reviewsRating = <ReviewsRatingModel>[].obs;
  var procedure = ''.obs;
  var image = Rx<File?>(null);
  var recipeImage = ''.obs;
  var isPending = true.obs;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> uploadImage(File image) async {
    try {
      String fileName = image.path.split('/').last;
      TaskSnapshot snapshot = await _storage.ref('recipe_images/$fileName').putFile(image);
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  void addIngredient() {
    ingredients.add(RecipeIngredientModel(name: ''.obs, quantity: ''.obs));
  }

  void submitRecipe() async {
    try {
      String? imageUrl;
      if (image.value != null) {
        imageUrl = await uploadImage(image.value!);
      }
      recipeImage.value = imageUrl!;
      print(recipeImage.value);
      await _repository.addRecipe(
        recipeName.value,
        chefName.value = controller.user.value.fullName,
        cookingTimeHours.value,
        cookingTimeMinutes.value,
        rating.value = 0,
        servings.value,
        category.value,
        description.value,
        ingredients.map((e) => RecipeIngredientModel(name: e.name, quantity: e.quantity)).toList(),
        reviewsRating.map((e) => ReviewsRatingModel(name: e.name, rating: e.rating, review: e.review)).toList(),
        procedure.value,
        recipeImage.value,
      );
      // Handle success (e.g., show a success message, navigate to another screen, etc.)
    } catch (e) {
      // Handle error (e.g., show an error message)
      print('Error submitting recipe: $e');
    }
  }

  void approveRecipe() async {
    try {
      await _repository.updateRecipe(
        recipeId.value,
      );
      // Handle success (e.g., show a success message, navigate to another screen, etc.)
    } catch (e) {
      // Handle error (e.g., show an error message)
      print('Error submitting recipe: $e');
    }
  }

  void declineRecipe() async {
    try {
      await _repository.deleteRecipe(
        recipeId.value,
      );
      // Handle success (e.g., show a success message, navigate to another screen, etc.)
    } catch (e) {
      // Handle error (e.g., show an error message)
      print('Error submitting recipe: $e');
    }
  }
}