import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({super.key,});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            height: 150,
            image: AssetImage(dark ? TImages.lightAppLogo : TImages.darkAppLogo),
        ),
        const Text(TTexts.loginTitle, style: TextStyle(
            color: Color(0xFFE85A4F),
            fontSize: 60,
            fontFamily: 'Rochester',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: TSizes.sm),
        Text(TTexts.loginSubTitle, style: TextStyle(
            color: dark ? TColors.dark: TColors.light,
            fontSize: 32,
            fontFamily: 'Rochester',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}