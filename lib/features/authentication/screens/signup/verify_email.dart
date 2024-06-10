
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:t_store/common/styles/spacing_styles.dart";
import "package:t_store/utils/constants/colors.dart";

import "package:t_store/utils/constants/image_strings.dart";
import "package:t_store/utils/constants/sizes.dart";
import "package:t_store/utils/constants/text_strings.dart";

import "package:t_store/utils/helpers/helper_functions.dart";

// import "../../../../data/repositories.authentication/authentication_repository.dart";
// import "../../controllers/signup/verify_email_controller.dart";


class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    // final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///Image
              Image(
                image: const AssetImage(TImages.deliveredEmailIllustration),
                width: THelperFunctions.screenWidth() * 0.6,
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              ///Title and Subtitle
              Text(
                TTexts.confirmEmail,
                style: TextStyle(
                  color: dark ? TColors.dark : const Color(0xFFE85A4F),
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                'rubaids0911@gmail.com',
                style: TextStyle(
                  color: dark ? TColors.dark : const Color(0xFFE85A4F),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                TTexts.confirmEmailSubTitle,
                style: TextStyle(
                  color: dark ? TColors.dark : const Color(0xFFE85A4F),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFE85A4F), // Background color
                      ),
                      child: const Text(TTexts.tContinue, style: TextStyle(color: TColors.dark),),)
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(TTexts.resendEmail, style: TextStyle(color: dark ? TColors.dark: TColors.light),)))
            ],
          ),
        ),
      ),
    );
  }
}