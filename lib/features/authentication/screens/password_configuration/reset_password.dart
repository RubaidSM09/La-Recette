import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))]
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Image with 60% of screen width
              Image(image: const AssetImage(TImages.deliveredEmailIllustration), width: THelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Title & Subtitle
              Text(TTexts.changeYourPasswordTitle,
                  style: TextStyle(
                    color: dark ? TColors.dark : const Color(0xFFE85A4F),
                    fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
                    fontWeight: Theme.of(context).textTheme.headlineMedium?.fontWeight,
                  ),
                  textAlign: TextAlign.center
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(TTexts.changeYourPasswordSubTitle,
                  style: TextStyle(
                    color: dark ? TColors.dark : const Color(0xFFE85A4F),
                    fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
                    fontWeight: Theme.of(context).textTheme.headlineMedium?.fontWeight,
                  ),
                  textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE85A4F),
                    ),
                    child: const Text(TTexts.done, style: TextStyle(color: TColors.dark),)),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(onPressed: (){}, child: Text(TTexts.resendEmail, style: TextStyle(color: dark ? TColors.dark : TColors.light))),
              ),
            ],
          ),
        ),
      ),
    );
  }

}