import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/validators/validation.dart';
import 'package:t_store/features/authentication/controllers/login/login_controller.dart';
import 'package:t_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:t_store/features/authentication/screens/signup/signup.dart';


import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    final controller = Get.put(LoginController());

    return Form(
        key: controller.loginFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
          child: Column(
          children: [
            ///Email
            TextFormField(
              style: TextStyle(color: dark ? TColors.dark : TColors.light),
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration:  InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right, color: dark ? TColors.dark : const Color(0xFFE85A4F),),
                  filled: true, // This makes the field background white
                  fillColor: dark ? const Color(0xFF3A3A3A) : Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: dark ? TColors.dark : const Color(0xFFE85A4F)),
                      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  ),
                  labelText: TTexts.email,
                  labelStyle: TextStyle(color: dark ? TColors.dark : const Color(0xFFE85A4F))),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields,),

            ///Password
            Obx(
              () => TextFormField(
                style: TextStyle(color: dark ? TColors.dark : TColors.light),
                validator: (value) => TValidator.validatePassword(value),
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                expands: false,
                  decoration: InputDecoration(
                    labelText: TTexts.password,
                    labelStyle: TextStyle(color: dark ? TColors.dark : const Color(0xFFE85A4F)),
                    filled: true, // This makes the field background white
                    fillColor: dark ? const Color(0xFF3A3A3A) : Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: dark ? TColors.dark : const Color(0xFFE85A4F)),
                      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    ),
                    prefixIcon: Icon(Iconsax.password_check, color: dark ? TColors.dark : const Color(0xFFE85A4F)),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye, color: dark ? TColors.dark : const Color(0xFFE85A4F)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            ///Remember me &Forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Remember me
                Row(
                  children: [
                    Obx(() => Checkbox(
                      value: controller.rememberMe.value,
                      onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value, activeColor: const Color(0xFFE85A4F),)),
                    Text(TTexts.rememberMe, style: TextStyle(color: dark ? TColors.dark : const Color(0xFFE85A4F),),)
                  ],
                ),
                ///Forget Password
                TextButton(onPressed: () => Get.to(() => const ForgetPassword()), child: Text(TTexts.forgetPassword, style: TextStyle(color: dark ? TColors.dark: TColors.light),)),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            ///Sign in button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => controller.emailAndPasswordSignIn(), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE85A4F)), child: const Text(TTexts.signIn, style: TextStyle(color: TColors.dark),))
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            ///Create account button
            SizedBox(width: double.infinity,child: OutlinedButton(onPressed: () => Get.to(() => const SignupScreen()), style: OutlinedButton.styleFrom(side: BorderSide(color: dark ? TColors.dark : TColors.light)),child: Text(TTexts.createAccount, style: TextStyle(color: dark ? TColors.dark : TColors.light),))),
            const SizedBox(height: TSizes.spaceBtwSections),
          ],
                ),
        ),
    );
  }
}