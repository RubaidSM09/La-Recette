import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class TSearchContainer extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  const TSearchContainer({
    super.key,
    required this.controller,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: TDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs), // Adjust padding to reduce height
          decoration: BoxDecoration(
            color: dark ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: TColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: TColors.darkerGrey),
              const SizedBox(width: TSizes.spaceBtwItems),
              Expanded(
                child: TextField(
                  controller: controller,
                  style: Theme.of(context).textTheme.bodySmall!.apply(
                      color: dark
                          ? const Color(0xFF999999)
                          : const Color(0xFF666666)),
                  decoration: InputDecoration(
                    hintText: text,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                      borderSide: BorderSide(
                        color: dark ? Colors.black : Colors.white, // Set the desired border color when not focused
                        width: 1.5, // Set the thickness of the border
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                      borderSide: BorderSide(
                        color: dark ? Colors.black : Colors.white, // Change to desired color when focused
                        width: 2.0, // Increase thickness on focus
                      ),
                    ),
                    /*border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                      borderSide: BorderSide(
                        color: dark ? Colors.black : Colors.white, // Default color
                      ),
                    ),*/ // Remove border
                    isDense: true, // Reduce the height
                    contentPadding: const EdgeInsets.symmetric(vertical: 15), // Adjust padding to reduce height
                    hintStyle: TextStyle(
                      color: dark
                          ? const Color(0xFF999999)
                          : const Color(0xFF666666),
                    ),
                  ),
                  onChanged: (value) {
                    if (onTap != null) onTap!(); // Trigger search on text change
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
