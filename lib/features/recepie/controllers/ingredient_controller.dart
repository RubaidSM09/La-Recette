import 'package:get/get.dart';
import 'package:t_store/common/widgets/loader/loaders.dart';
import 'package:t_store/data/repositories/ingredient/ingredient_repository.dart';
import 'package:t_store/features/recepie/models/ingredient_model.dart';

class IngredientController extends GetxController {
  static IngredientController get instance => Get.find();

  final isLoading = false.obs;
  final ingredientRepository = Get.put(IngredientRepository());
  RxList<IngredientModel> allIngredients = <IngredientModel>[].obs;

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

    } catch(e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}