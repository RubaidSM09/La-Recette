import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

// import '../../../../features/shop/controllers/product/favourites_controller.dart';
import '../../icons/t_circular_icon.dart';

class TFavouriteIcon extends StatelessWidget {
  const TFavouriteIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(FavouritesController());
    return const TCircularIcon(
        icon: Iconsax.heart5,
        color: Colors.red,
    );
  }
}
