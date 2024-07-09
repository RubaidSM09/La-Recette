import 'package:get/get.dart';
import 'package:t_store/features/recepie/models/addrecipe_ingredients_model.dart';
import 'package:t_store/lib/data/repositories/recipe/add_ingredients_repository.dart';
import 'package:t_store/data/repositories/recipe/addrecipe_ingredients_repository.dart';
class AddIngredientsController extends GetxController {
  final AddIngredientsRepository _repository = AddIngredientsRepository();

  var recipeName = ''.obs;
  var cookingTimeHours = ''.obs;
  var cookingTimeMinutes = ''.obs;
  var servings = ''.obs;
  var category = ''.obs;
  var description = ''.obs;
  var ingredients = <RecipeIngredientModel>[].obs;
  var procedure = ''.obs;
  var imageUrl = ''.obs;

  void addIngredient() {
    ingredients.add(RecipeIngredientModel(name: ''.obs, quantity: ''.obs));
  }

  void submitRecipe() async {
    try {
      await _repository.addRecipe(
        recipeName.value,
        cookingTimeHours.value,
        cookingTimeMinutes.value,
        servings.value,
        category.value,
        description.value,
        ingredients.map((e) => RecipeIngredientModel(name: e.name, quantity: e.quantity)).toList(),
        procedure.value,
        imageUrl.value,
      );
      // Handle success (e.g., show a success message, navigate to another screen, etc.)
    } catch (e) {
      // Handle error (e.g., show an error message)
      print('Error submitting recipe: $e');
    }
  }
}