import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
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
    final controller=Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  style: TextStyle(color: dark ? TColors.dark : const Color(0xFFE85A4F)),
                  controller: controller.firstName,
                  validator: (value) => TValidator.validateEmptyText('First name', value),
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
                  style: TextStyle(color: dark ? TColors.dark : const Color(0xFFE85A4F)),
                  controller: controller.lastName,
                  validator: (value) => TValidator.validateEmptyText('Last name', value),
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
            style: TextStyle(color: dark ? TColors.dark : const Color(0xFFE85A4F)),
            controller: controller.username,
            validator: (value) => TValidator.validateEmptyText('Username', value),

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
            style: TextStyle(color: dark ? TColors.dark : const Color(0xFFE85A4F)),
            validator: (value) => TValidator.validateEmail(value),
            controller: controller.email,
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
            style: TextStyle(color: dark ? TColors.dark : const Color(0xFFE85A4F)),
            validator: (value) => TValidator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
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
          Obx(
                () => TextFormField(
                  style: TextStyle(color: dark ? TColors.dark : const Color(0xFFE85A4F)),
                  validator: (value) => TValidator.validatePassword(value),
                  controller: controller.password,
                  obscureText: controller.hidePassword.value,
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TTexts.password,
                    labelStyle: TextStyle(color: dark ? TColors.dark : const Color(0xFFE85A4F), fontSize: 16),
                    prefixIcon: Icon(Iconsax.password_check, color: dark ? TColors.dark : const Color(0xFFE85A4F),),
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye)
                    ),
                    filled: true,
                    fillColor: dark ? const Color(0xFF3A3A3A) : Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: dark ? TColors.dark : const Color(0xFFE85A4F)),
                      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    ),
                  ),
                ),
          ),

          const SizedBox(height: TSizes.spaceBtwSections),
          ///Term&Conditions Checkbox
          const TTermsAndConditionCheckbox(),
          const SizedBox(height: TSizes.spaceBtwSections),
          ///Sign Up Button
          SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=> controller.signup(), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE85A4F)), child: const Text(TTexts.createAccount, style: TextStyle(color: TColors.dark),))),
        ],
      ),
    );
  }
}

