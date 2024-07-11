import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:t_store/features/personalization/screens/admin/widgets/admin_recipe_details.dart';
import 'package:t_store/features/recepie/controllers/recipe/recipe_controller.dart';
import 'package:t_store/features/recepie/models/recipe_model.dart';

class AdminPendingRecipeList extends StatelessWidget {
  const AdminPendingRecipeList({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(RecipeController());

    return Scaffold(
      backgroundColor: const Color(0xFFEAE7DC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEAE7DC),
        title: const Text(
          'Pending Recipes',
          style: TextStyle(
            color: Color(0xFFE85A4F),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: 650,
                child: Obx(() {
                  if(controller.isLoading.value) return const TVerticalProductShimmer();
                  print(controller.pendingRecipes.length);

                  if(controller.pendingRecipes.isEmpty) {
                    return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium));
                  }
                  return TGridLayout(
                    itemCount: controller.pendingRecipes.length,
                    itemBuilder: (_, index) =>
                    RecipeCard(recipe: controller.pendingRecipes[index]),
                  );
                }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => AdminRecipePage(recipe: recipe)),
      child: Container(
        height: 250,
        width: 150,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8), // Add some space at the top
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: TRoundedImage(
                  imageUrl: recipe.thumbnail,
                  applyImageRadius: true,
                  isNetworkImage: true,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE85A4F),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      recipe.chef,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Center(
                        child: ElevatedButton(
                          onPressed: () => Get.to(() => AdminRecipePage(recipe: recipe)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE85A4F), // Button color
                            foregroundColor: Colors.white, // Text color
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(12), // Border radius
                            ),
                          ),
                          child: const Text('View'),
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
