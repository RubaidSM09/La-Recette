import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/recepie/models/addrecipe_ingredients_model.dart';
import 'package:t_store/features/recepie/models/addrecipe_model.dart';

class AddIngredientsRepository {
  final _db = FirebaseFirestore.instance;

  Future<void> addRecipe(
      String recipeName,
      String chefName,
      String cookingTimeHours,
      String cookingTimeMinutes,
      double rating,
      int servings,
      String category,
      String description,
      List<RecipeIngredientModel> ingredients,
      List<ReviewsRatingModel> reviewRating,
      String procedure,
      String imageUrl,
      ) async {
    try {
      await _db.collection('recipe').add({
        'Title': recipeName,
        'Chef': chefName,
        'Time': '$cookingTimeHours:$cookingTimeMinutes',
        'Ratings': rating,
        'Servings': servings,
        'Category': category,
        'Description': description,
        'Ingredients': ingredients.map((e) => e.toJson()).toList(),
        'RatingReview': reviewRating.map((e) => e.toJson()).toList(),
        'Directions': procedure,
        'Image': imageUrl,
        'IsPending': true,
      });
    } catch (e) {
      throw 'Error adding recipe: $e';
    }
  }

  Future<void> updateRecipe(
      String recipeId,
      ) async {
    try {
      await _db.collection('recipe').doc(recipeId).update({
        'IsPending': false,
      });
    } catch (e) {
      throw 'Error adding recipe: $e';
    }
  }

  Future<void> deleteRecipe(
      String recipeId,
      ) async {
    try {
      await _db.collection('recipe').doc(recipeId).delete();
    } catch (e) {
      throw 'Error adding recipe: $e';
    }
  }
}