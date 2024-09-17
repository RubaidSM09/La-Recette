import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/validators/validation.dart';

class ChangeNumberScreen extends StatelessWidget {
  const ChangeNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller=Get.put(UpdateNameController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Phone Number',
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
            key: controller.updatePhoneNumberFormKey,
            child: Column(
              children: [
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
                const SizedBox(height: 36),
                ElevatedButton(
                  onPressed: ()=> controller.updatePhoneNumber(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE85A4F), // Background color
                    foregroundColor: const Color(0xFFEAE7DC), // Text color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                    textStyle: const TextStyle(
                      fontSize: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Rounded corners
                    ),
                  ),
                  child: const Text('Update Phone Number'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
