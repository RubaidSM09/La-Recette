import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/validators/validation.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller=Get.put(UpdateNameController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Name',
          style: TextStyle(
            color: dark ? TColors.dark : TColors.light,
          ),
        ),
        centerTitle: true,
        // backgroundColor: const Color(0xFFEAE7DC),
        elevation: 0,
      ),
      // backgroundColor: const Color(0xFFEAE7DC),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key: controller.updateUserNameFormKey,
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(color: dark ? TColors.dark : TColors.light),
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
                const SizedBox(
                    height: 16.0), // Optional: Add space between the containers
                TextFormField(
                  style: TextStyle(color: dark ? TColors.dark : TColors.light),
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
                const SizedBox(height: 36),
                ElevatedButton(
                  onPressed: ()=> controller.updateUserName(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE85A4F), // Background color
                    foregroundColor: const Color(0xFFEAE7DC), // Text color
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                    textStyle: const TextStyle(
                      fontSize: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Rounded corners
                    ),
                  ),
                  child: const Text('Update Name'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
