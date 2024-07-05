import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/recepies/recepie_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:t_store/features/recepie/controllers/recipe/favourites_controller.dart';
import 'package:t_store/features/recepie/controllers/recipe/recipe_controller.dart';
import 'package:t_store/features/recepie/screens/home/home.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/popups/animation_loader.dart';

import '../../../../common/widgets/appbar/appbar.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    final controller = FavouritesController.instance;
    
    return Scaffold(
      appBar: TAppBar(
        title: Text('Favourites', style: Theme.of(context).textTheme.headlineMedium!.apply(color: dark ? TColors.dark : const Color(0xFFE85A4F))),
      ),

      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: dark ? TColors.dark : const Color(0xFFE85A4F),
        onPressed: () => Get.to(const HomeScreen()),
        child: Icon(Icons.add, color: dark ? TColors.light : TColors.dark,),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),

          child: Obx(
                () => FutureBuilder(
                  future: controller.favouriteRecipes(),
                  builder: (context,snapshot) {
                    final emptyWidget =TAnimationLoaderWidget(
                      text: 'Whoops! Wishlist is Empty...',
                      animation:TImages.docerAnimation,
                      //showAction:true,
                      //actionText:'Let\'s add some',
                      onActionPressed: () => Get.off(() => const NavigationMenu()) ,
                    );

                    const loader=TVerticalProductShimmer(itemCount: 6,);
                    final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader,nothingFound: emptyWidget);
                    if(widget!= null) return widget;

                    final recipes =snapshot.data!;
                    return TGridLayout(
                        itemCount: recipes.length,
                        itemBuilder: (_, index) => TProductCardVertical(recipe: recipes[index])
                    );
                  }
                ),
              )
          ),
        ),
      // body: Container(color: Colors.orange,),
    );
  }
  
}