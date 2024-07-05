import 'dart:convert';

import 'package:get/get.dart';
import 'package:t_store/common/widgets/loader/loaders.dart';
import 'package:t_store/data/repositories/recipe/recipe_repository.dart';
import 'package:t_store/features/recepie/models/recipe_model.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();
  
  final favourites =<String, bool>{}.obs;

  @override
  void onInit(){
    super.onInit();
    initFavourites();
  }

  //method to initialize favourites by reading from storage
  Future<void> initFavourites() async {
    final json =TLocalStorage.instance().readData('favourites');
    if(json != null) {
      final storedFavourites =jsonDecode(json) as Map<String ,dynamic>;
      favourites.assignAll(storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String recipeId)  {
    return favourites[recipeId] ?? false;
  }

  void toggleFavouriteProduct (String recipeId) {
    if(!favourites.containsKey(recipeId)){
      favourites[recipeId] =true;
      saveFavouritesToStorage();
      TLoaders.customToast(message: 'Recipe has been added to favourites.');
    } else {
      TLocalStorage.instance().removeData(recipeId);
      favourites.remove(recipeId);
      saveFavouritesToStorage();
      favourites.refresh();
      TLoaders.customToast(message: 'Recipe has been removed from the favourites.');
    }
  }

  void saveFavouritesToStorage(){
    final encodedFavourites =json.encode(favourites);
    TLocalStorage.instance().saveData('favourites' , encodedFavourites);
  }

  Future<List<RecipeModel>> favouriteRecipes() async {
    return await RecipeRepository.instance.getFavouriteRecipes(favourites.keys.toList());
  }
}