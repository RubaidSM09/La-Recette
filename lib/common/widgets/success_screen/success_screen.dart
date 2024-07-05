import 'package:flutter/material.dart';
import 'package:t_store/common/styles/spacing_styles.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';


class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image,title,subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              ///Image
              Image(image: AssetImage(image),width: THelperFunctions.screenWidth() * 0.6,),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///Title & SubTitle
              Text(title,style: Theme.of(context).textTheme.headlineMedium!.apply(color: dark ? TColors.dark : const Color(0xFFE85A4F)),textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(subTitle,style: Theme.of(context).textTheme.labelMedium!.apply(color: dark ? TColors.dark : const Color(0xFFE85A4F)),textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///Button
              SizedBox(width: double.infinity,child:ElevatedButton(onPressed: onPressed, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE85A4F)), child:const Text(TTexts.tContinue, style: TextStyle(color: TColors.dark),),),),
              const SizedBox(height: TSizes.spaceBtwItems,),
             // SizedBox(width: double.infinity,child:TextButton(onPressed: (){},child:const Text(TTexts.resendEmail),),),


            ],
          ),
        ),
      ),
    );
  }
}
