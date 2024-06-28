import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/recepies/recepie_cards/product_card_vertical.dart';
import 'package:t_store/features/recepie/screens/home/home.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/appbar/appbar.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    
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
          child: Column(
            children: [
              TGridLayout(itemCount: 3, itemBuilder: (_, index) => const TProductCardVertical())],
          ),
        ),
      ),
      // body: Container(color: Colors.orange,),
    );
  }
  
}