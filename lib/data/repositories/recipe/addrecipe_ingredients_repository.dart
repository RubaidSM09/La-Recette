import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/recepie/models/addrecipe_ingredients_model.dart';
import 'package:t_store/features/recepie/models/addrecipe_model.dart';

class AddIngredientsRepository {
  final _db = FirebaseFirestore.instance;

  Future<void> addRecipe(
      String recipeName,
      String cookingTimeHours,
      String cookingTimeMinutes,
      String servings,
      String category,
      String description,
      List<RecipeIngredientModel> ingredients,
      String procedure,
      String imageUrl,
      ) async {
    try {
      await _db.collection('recipe').add({
        'recipeName': recipeName,
        'cookingTime': '$cookingTimeHours:$cookingTimeMinutes',
        'servings': servings,
        'category': category,
        'description': description,
        'ingredients': ingredients.map((e) => e.toJson()).toList(),
        'procedure': procedure,
        'imageUrl': imageUrl,
      });
    } catch (e) {
      throw 'Error adding recipe: $e';
    }
  }
}