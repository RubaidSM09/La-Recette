import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/recepie/controllers/recipe/favourites_controller.dart';

// import '../../../../features/shop/controllers/product/favourites_controller.dart';
import '../../icons/t_circular_icon.dart';

class TFavouriteIcon extends StatelessWidget {
  const TFavouriteIcon({
    super.key,
    required this.recipeId,
  });

  final String recipeId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(() => TCircularIcon(
        icon: controller.isFavourite(recipeId) ? Iconsax.heart5 : Iconsax.heart5,
        color: controller.isFavourite(recipeId) ? Colors.red : null,
        onPressed: () => controller.toggleFavouriteProduct(recipeId),
      ),
    );
  }
}
