import 'package:get/get.dart';
import 'package:t_store/common/widgets/loader/loaders.dart';
import 'package:t_store/data/repositories/ingredient/ingredient_repository.dart';
import 'package:t_store/features/recepie/models/ingredient_model.dart';

class IngredientController extends GetxController {
  static IngredientController get instance => Get.find();

  final isLoading = false.obs;
  final ingredientRepository = Get.put(IngredientRepository());
  RxList<IngredientModel> allIngredients = <IngredientModel>[].obs;
  RxList<IngredientModel> filteredIngredients = <IngredientModel>[].obs;

  @override
  void onInit() {
    fetchAllIngredients();
    super.onInit();
  }

  void fetchAllIngredients() async {
    try {
      // Show loader while loading Recipes
      isLoading.value = true;

      // Fetch Recipes
      final ingredients = await ingredientRepository.getAllIngredients();

      // Assign Recipes
      allIngredients.assignAll(ingredients);

      filteredIngredients.assignAll(allIngredients);

    } catch(e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// -- Search Ingredients
  void searchIngredients(String query) {
    if (query.isEmpty) {
      // If search query is empty, reset the filtered recipes to all approved recipes
      filteredIngredients.assignAll(allIngredients);
    } else {
      filteredIngredients.assignAll(
        allIngredients.where((recipe) =>
        recipe.title.toLowerCase().contains(query.toLowerCase()))
            .toList(),
      );
    }
  }
}