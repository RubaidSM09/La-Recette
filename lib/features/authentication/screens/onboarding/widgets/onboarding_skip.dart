import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';



class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: const Text('Skip',
          style: TextStyle(
            color: Color(0xFFE85A4F),
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 0.17,
            letterSpacing: 0.20,
          ),
        ),
      ),
    );
  }
}