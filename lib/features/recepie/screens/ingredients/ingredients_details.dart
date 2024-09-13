import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:t_store/features/recepie/controllers/recipe/recipe_controller.dart';
import 'package:t_store/features/recepie/models/ingredient_model.dart';
import 'package:t_store/features/recepie/screens/recipe_details/recipe_details.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/popups/animation_loader.dart';

class IngredientsDetailsPage extends StatelessWidget {
  const IngredientsDetailsPage({super.key, required this.ingredient});

  final IngredientModel ingredient;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RecipeController());
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header image
                Container(
                  height: 244,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(ingredient.thumbnail),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems,),
                // Title
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    ingredient.title,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 1.5,
                      color: Color(0xFFE85A4F),
                    ),
                  ),
                ),

                // Description Section
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    'Description',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      height: 1.5,
                      color: dark ? TColors.dark : TColors.light,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                  child: Container(
                    // width: 332,
                    // height: 98,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(2, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ingredient.description!.toString(),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                          fontSize: 11,
                          height: 1.5,
                          color: Colors.black.withOpacity(0.72),
                        ),
                      ),
                    ),
                  ),
                ),
                // Ingredients Section
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    'Used Dishes',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      height: 1.5,
                      color: dark ? TColors.dark : TColors.light,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                  child: Container(
                    // width: 332,
                    // height: 226,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(2, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FutureBuilder(
                      future: controller.fetchRecipesByIngredient(ingredient.title),
                      builder: (context,snapshot) {
                        final emptyWidget =TAnimationLoaderWidget(
                          text: 'Whoops! No Recipes...',
                          animation:TImages.docerAnimation,
                          //showAction:true,
                          //actionText:'Let\'s add some',
                          onActionPressed: () => Get.off(() => const NavigationMenu()) ,
                        );

                        const loader=TVerticalProductShimmer(itemCount: 6,);
                        final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader,nothingFound: emptyWidget);
                        if(widget!= null) return widget;

                        final recipes =snapshot.data!;

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: recipes.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () => Get.to(() => RecipePage(recipeId: recipes[index].id)),
                                  child: buildIngredientRow(recipes[index].title),
                                );
                              }
                          ),
                        );
                      }
                    ),
                  ),
                ),
              ],
            ),
          )
    );
  }

  Widget buildIngredientRow(String ingredient) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ingredient,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
