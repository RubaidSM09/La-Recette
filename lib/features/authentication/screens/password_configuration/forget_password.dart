import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/theme/widget_themes/text_theme.dart';

import '../../../../utils/constants/sizes.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(TTexts.forgetPasswordTitle,
                style: TextStyle(
                  color: dark ? TColors.dark : const Color(0xFFE85A4F),
                  fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
                  fontWeight: Theme.of(context).textTheme.headlineMedium?.fontWeight,
                )
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(TTexts.forgetPasswordSubTitle,
                style: TextStyle(
                  color: dark ? TColors.dark : const Color(0xFFE85A4F),
                  fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
                  fontWeight: Theme.of(context).textTheme.headlineMedium?.fontWeight,
                )
            ),
            const SizedBox(height: TSizes.spaceBtwSections * 2),

            /// Text field
            TextFormField(
              decoration: InputDecoration(
                labelText: TTexts.email,
                labelStyle: TextStyle(
                    color: dark ? TColors.dark : const Color(0xFFE85A4F),
                    fontSize: 16
                ),
                prefixIcon: Icon(Iconsax.direct_right, color: dark ? TColors.dark : const Color(0xFFE85A4F),),
                filled: true,
                fillColor: dark ? const Color(0xFF3A3A3A) : Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: dark ? TColors.dark : const Color(0xFFE85A4F)),
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Submit Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const ResetPassword()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE85A4F),
                    ),
                    child: const Text(TTexts.submit, style: TextStyle(color: TColors.dark),)
                )
            )
          ],
        ),
      ),
    );
  }
}