import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
// import 'package:t_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/validators/validation.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    // final controller=Get.put(SignupController());
    return Form(
      // key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                      labelText: TTexts.firstName, 
                      labelStyle: TextStyle(color: dark ? TColors.dark : const Color(0xFFE85A4F), fontSize: 16),
                      prefixIcon: Icon(Iconsax.user, color: dark ? TColors.dark : const Color(0xFFE85A4F),),
                      filled: true,
                      fillColor: dark ? const Color(0xFF3A3A3A) : Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: dark ? TColors.dark : const Color(0xFFE85A4F)),
                        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                      ),
                  ),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TTexts.lastName,
                    labelStyle: TextStyle(color: dark ? TColors.dark : const Color(0xFFE85A4F), fontSize: 16),
                    prefixIcon: Icon(Iconsax.user, color: dark ? TColors.dark : const Color(0xFFE85A4F),),
                    filled: true,
                    fillColor: dark ? const Color(0xFF3A3A3A) : Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: dark ? TColors.dark : const Color(0xFFE85A4F)),
                      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          ///Username
          TextFormField(
            expands: false,
            decoration: InputDecoration(
              labelText: TTexts.username,
              labelStyle: TextStyle(color: dark ? TColors.dark : const Color(0xFFE85A4F), fontSize: 16),
              prefixIcon: Icon(Iconsax.user_edit, color: dark ? TColors.dark : const Color(0xFFE85A4F),),
              filled: true,
              fillColor: dark ? const Color(0xFF3A3A3A) : Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: dark ? TColors.dark : const Color(0xFFE85A4F)),
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              ),
            ),
          ),
          ///Email
          const SizedBox(height: TSizes.spaceBtwInputFields),
          TextFormField(
            validator: (value) => TValidator.validateEmail(value),
            expands: false,
            decoration: InputDecoration(
                labelText: TTexts.email,
                labelStyle: TextStyle(color: dark ? TColors.dark : const Color(0xFFE85A4F), fontSize: 16),
                prefixIcon: Icon(Iconsax.direct, color: dark ? TColors.dark : const Color(0xFFE85A4F),),
              filled: true,
              fillColor: dark ? const Color(0xFF3A3A3A) : Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: dark ? TColors.dark : const Color(0xFFE85A4F)),
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              ),
            ),
          ),
          ///Phone Number
          const SizedBox(height: TSizes.spaceBtwInputFields),
          TextFormField(
            validator: (value) => TValidator.validatePhoneNumber(value),
            decoration: InputDecoration(
                labelText: TTexts.phoneNo,
                labelStyle: TextStyle(color: dark ? TColors.dark : const Color(0xFFE85A4F), fontSize: 16),
                prefixIcon: Icon(Iconsax.call, color: dark ? TColors.dark : const Color(0xFFE85A4F),),
              filled: true,
              fillColor: dark ? const Color(0xFF3A3A3A) : Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: dark ? TColors.dark : const Color(0xFFE85A4F)),
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              ),
            ),
          ),
          ///Password
          const SizedBox(height: TSizes.spaceBtwInputFields),
          TextFormField(
            validator: (value) => TValidator.validatePassword(value),
            expands: false,
            decoration: InputDecoration(
            labelText: TTexts.password,
              labelStyle: TextStyle(color: dark ? TColors.dark : const Color(0xFFE85A4F), fontSize: 16),
            prefixIcon: Icon(Iconsax.password_check, color: dark ? TColors.dark : const Color(0xFFE85A4F),),
            suffixIcon: IconButton(
              onPressed: () => {},
              icon: Icon(Iconsax.eye, color: dark ? TColors.dark : const Color(0xFFE85A4F),)
            ),
              filled: true,
              fillColor: dark ? const Color(0xFF3A3A3A) : Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: dark ? TColors.dark : const Color(0xFFE85A4F)),
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          ///Term&Conditions Checkbox
          const TTermsAndConditionCheckbox(),
          const SizedBox(height: TSizes.spaceBtwSections),
          ///Sign Up Button
          SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=> Get.to(() => const VerifyEmailScreen()), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE85A4F)), child: const Text(TTexts.createAccount, style: TextStyle(color: TColors.dark),))),
        ],
      ),
    );
  }
}

