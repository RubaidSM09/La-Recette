import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/recepie/screens/blogs/blogs.dart';
import 'package:t_store/features/recepie/screens/home/home.dart';
import 'package:t_store/features/recepie/screens/favourites/favourites.dart';
import 'package:t_store/features/recepie/screens/ingredients/ingredients.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import 'features/personalization/screens/settings/settings.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? TColors.light : TColors.dark,
          indicatorColor: darkMode
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.message), label: 'Blogs'),
            NavigationDestination(
                icon: Icon(Iconsax.activity), label: 'Ingredients'),
            NavigationDestination(
                icon: Icon(Iconsax.heart), label: 'Favourites'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const BlogsScreen(),
    const IngredientsScreen(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];
  // final screens = [Colors.red, Colors.green, Colors.blue, Colors.yellow,];
}
