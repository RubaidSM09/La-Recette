import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:t_store/features/authentication/controllers/signup/signup_controller.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TTermsAndConditionCheckbox extends StatelessWidget {
  const TTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Add this line to align text to the top
      children: [
        SizedBox(
          width: 24,height: 24,
          child: Checkbox(value: true, onChanged: (value){})),
        const SizedBox(width: TSizes.spaceBtwItems),
        Flexible( // Use Flexible to allow text to wrap if it's too long
          child: Text.rich(
            TextSpan(children: [
              TextSpan(
                  text: '${TTexts.iAgreeTo} ',
                  style: TextStyle(
                    color: dark ? TColors.dark : TColors.light,
                  ),
              ),
              TextSpan(
                text: '${TTexts.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.white : const Color(0xFFE85A4F),
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? TColors.white : const Color(0xFFE85A4F),
                ),
              ),
              TextSpan(
                  text: '${TTexts.and} ',
                  style: TextStyle(
                    color: dark ? TColors.dark : TColors.light,
                  ),
              ),
              TextSpan(
                text: TTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.white : const Color(0xFFE85A4F),
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? TColors.white : const Color(0xFFE85A4F),
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
