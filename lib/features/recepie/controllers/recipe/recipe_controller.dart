import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/common/widgets/loader/loaders.dart';
import 'package:t_store/data/repositories/recipe/recipe_repository.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/recepie/models/recipe_model.dart';

class RecipeController extends GetxController {
  static RecipeController get instance => Get.find();

  final isLoading = false.obs;
  final recipeRepository = Get.put(RecipeRepository());
  // final controller = Get.put(UserController());
  RxList<RecipeModel> approvedRecipes = <RecipeModel>[].obs;
  RxList<RecipeModel> pendingRecipes = <RecipeModel>[].obs;
  RxList<RecipeModel> categorizedRecipes = <RecipeModel>[].obs;
  RxList<RecipeModel> recipesByIngredient = <RecipeModel>[].obs;
  RxList<RecipeModel> myRecipes = <RecipeModel>[].obs;

  @override
  void onInit() {
    fetchApprovedRecipes();
    fetchPendingRecipes();
    super.onInit();
  }

  void fetchApprovedRecipes() async {
    try {
      // Show loader while loading Recipes
      isLoading.value = true;

      // Fetch Recipes
      final recipes = await recipeRepository.getApprovedRecipes();
      print(recipes[0].title);

      // Assign Recipes
      approvedRecipes.assignAll(recipes);

    } catch(e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void fetchPendingRecipes() async {
    try {
      // Show loader while loading Recipes
      isLoading.value = true;

      // Fetch Recipes
      final recipes = await recipeRepository.getPendingRecipes();

      // Assign Recipes
      pendingRecipes.assignAll(recipes);

    } catch(e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// -- Load selected category data
  Future<List<RecipeModel>> fetchCategorizedRecipes(String category) async {
    try{
      final recipes = await RecipeRepository.instance.getCategorizedRecipes(category);
      categorizedRecipes.assignAll(recipes);
      return categorizedRecipes;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// -- Load recipe according to ingredient
  Future<List<RecipeModel>> fetchRecipesByIngredient(String ingredient) async {
    try{
      final recipes = await RecipeRepository.instance.getRecipesByIngredients(ingredient);
      recipesByIngredient.assignAll(recipes);
      return recipesByIngredient;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  Future<List<RecipeModel>> fetchMyRecipes(String chef) async {
    try {
      // Show loader while loading Recipes
      isLoading.value = true;

      // Fetch Recipes
      final recipes = await recipeRepository.getMyRecipes(chef);

      // Assign Recipes
      myRecipes.assignAll(recipes);
      return myRecipes;

    } catch(e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    } finally {
      isLoading.value = false;
    }
  }
}