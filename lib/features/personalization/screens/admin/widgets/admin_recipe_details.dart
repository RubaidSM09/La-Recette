import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/personalization/screens/admin/widgets/pending_recipe.dart';
import 'package:t_store/features/recepie/controllers/recipe/addrecipe_ingredients_controller.dart';
import 'package:t_store/features/recepie/models/recipe_model.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class AdminRecipePage extends StatelessWidget {
  const AdminRecipePage({super.key, required this.recipe});

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    final AddIngredientsController controller = Get.put(AddIngredientsController());
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
                        image: NetworkImage(recipe.thumbnail),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                const SizedBox(height: TSizes.spaceBtwItems,),
                // Title
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                      recipe.title,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        height: 1.5,
                        color: Color(0xFFE85A4F),
                      ),
                    ),
                ),
                // Chef's name
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                      recipe.chef,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        height: 1.5,
                        color: dark ? TColors.dark : TColors.light,
                      ),
                    ),
                ),
                // Cooking Time and Rating
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Row(
                      children: [
                        const Icon(Icons.timer, color: Color(0xFFFF7900), size: 12),
                        const SizedBox(width: 4),
                        Text(
                          recipe.time,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                            fontSize: 9,
                            height: 1.5,
                            color: dark ? TColors.dark : TColors.light,
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Icon(Icons.star, color: Color(0xFFFEA801), size: 12),
                        const SizedBox(width: 4),
                        Text(
                          recipe.ratings.toString(),
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                            fontSize: 9,
                            height: 1.5,
                            color: dark ? TColors.dark : TColors.light,
                          ),
                        ),
                      ],
                    ),
                ),
                // Servings
                Padding(
                  padding: const EdgeInsets.only(left: 12, bottom: 12),
                  child: Row(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Servings:',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                height: 1.5,
                                color: Color(0xFFE85A4F),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              recipe.servings.toString(),
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                height: 1.5,
                                color: dark ? TColors.dark : TColors.light,
                              ),
                            ),
                          ],
                        ),
                      ],
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
                          recipe.description!.toString(),
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
                      'Ingredients',
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
                      height: 226,
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
                        child: ListView.builder(
                            itemCount: recipe.ingredients?.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {},
                                child: buildIngredientRow(recipe.ingredients![index].name.toString(), recipe.ingredients![index].quantity.toString()),
                              );
                            }
                        ),
                      ),
                    ),
                ),
                // Directions Section
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                      'Directions',
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
                      // width: 330,
                      // height: 487,
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
                          recipe.direction!.toString(),
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            height: 1.5,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                ),
                // Reviews & Ratings Section
                Padding(
                  padding: const EdgeInsets.only(left: 12, bottom: TSizes.spaceBtwSections),
                  child: Row(
                      children: [
                        Text(
                          'Category:',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            height: 1.5,
                            color: dark ? TColors.dark : TColors.light,
                          ),
                        ),
                        const SizedBox(width: 4,),
                        Text(
                          recipe.servings.toString(),
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            height: 1.5,
                            color: dark ? TColors.dark : TColors.light,
                          ),
                        ),
                      ],
                    ),
                ),
                Center(
                  child: SizedBox(
                      width: 180,
                      child: ElevatedButton(onPressed: () {
                        controller.isPending.value = false;
                        controller.recipeId.value = recipe.id;
                        controller.approveRecipe();
                        Get.to(() => const NavigationMenu());
                      }, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE85A4F)), child: const Text("Accept", style: TextStyle(color: TColors.dark),))
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Center(
                  child: SizedBox(
                      width: 180,
                      child: ElevatedButton(onPressed: () {
                        controller.recipeId.value = recipe.id;
                        controller.declineRecipe();
                        Get.to(() => const NavigationMenu());
                      }, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE85A4F)), child: const Text("Reject", style: TextStyle(color: TColors.dark),))
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
              ],
            ),
          ),
    );
  }

  Widget buildIngredientRow(String ingredient, String quantity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ingredient,
            style: const TextStyle(fontSize: 12),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              quantity,
              style: const TextStyle(fontSize: 12, color: Color(0xFFE85A4F)),
            ),
          ),
        ],
      ),
    );
  }
}
