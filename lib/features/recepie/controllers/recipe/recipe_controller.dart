import 'package:get/get.dart';
import 'package:t_store/common/widgets/loader/loaders.dart';
import 'package:t_store/data/repositories/recipe/recipe_repository.dart';
import 'package:t_store/features/recepie/models/recipe_model.dart';

class RecipeController extends GetxController {
  static RecipeController get instance => Get.find();

  final isLoading = false.obs;
  final recipeRepository = Get.put(RecipeRepository());
  RxList<RecipeModel> allRecipes = <RecipeModel>[].obs;

  @override
  void onInit() {
    fetchAllRecipes();
    super.onInit();
  }

  void fetchAllRecipes() async {
    try {
      // Show loader while loading Recipes
      isLoading.value = true;

      // Fetch Recipes
      final recipes = await recipeRepository.getAllRecipes();

      // Assign Recipes
      allRecipes.assignAll(recipes);

    } catch(e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}