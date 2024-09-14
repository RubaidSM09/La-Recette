import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/recepie/models/addrecipe_ingredients_model.dart';

class AddIngredientsRepository {
  final _db = FirebaseFirestore.instance;

  Future<String> addRecipe(
      String recipeName,
      String chefName,
      String chefId,
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
      DocumentReference docRef = await _db.collection('recipe').add({
        'Title': recipeName,
        'Chef': chefName,
        'ChefId': chefId,
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

      // Return the auto-generated recipe ID
      return docRef.id;
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

  Future<void> updateRatings(
      String recipeId,
      double avgRatings,
      ) async {
    try {
      await _db.collection('recipe').doc(recipeId).update({
        'Ratings': avgRatings,
      });
    } catch (e) {
      throw 'Error adding recipe: $e';
    }
  }
}