import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:t_store/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:t_store/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:t_store/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/onboarding/onboarding_controller.dart';




class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            left: 79,
            top: 130,
            child: SizedBox(
              width: 211,
              height: 74,
              child: Text(
                'La Recette',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFE85A4F),
                  fontSize: 60,
                  fontFamily: 'Rochester',
                  fontWeight: FontWeight.w400,
                  height: 0.01,
                  letterSpacing: 0.20,
                ),
              ),
            ),
          ),
          Positioned(
            left: 36,
            top: 197,
            child: SizedBox(
              width: 296,
              height: 43,
              child: Text(
                'Discover, Share, Savor',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: dark ? TColors.dark: TColors.light,
                  fontSize: 32,
                  fontFamily: 'Rochester',
                  fontWeight: FontWeight.w400,
                  height: 0.02,
                  letterSpacing: 0.20,
                ),
              ),
            ),
          ),
          Positioned(
            left: -35,
            top: 512,
            child: Container(
              width: 464,
              height: 464,
              decoration: const ShapeDecoration(
                color: Color(0xFFE85A4F),
                shape: OvalBorder(),
              ),
            ),
          ),
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// skip button
          const OnBoardingSkip(),

          ///Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          ///Circular Button
          const OnBoardingNextButton()

        ],
      ),
    );
  }
}


