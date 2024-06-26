import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
// import 'package:t_store/features/shop/models/category_model.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';


class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor,
    this.backgroundColor,
    this.isNetworkImage = true,
    this.onTap,
  });

  final String image, title;
  final Color? textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
          child: Column(
            children: [
              //circular icon
              Container(
                width: 56,
                height: 56,
                padding: const EdgeInsets.all(TSizes.sm),
                decoration: BoxDecoration(
                  color: backgroundColor ?? (dark ? TColors.dark : const Color(0xFFE85A4F)),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: TCircularImage(
                    image: image,
                    fit: BoxFit.fitWidth,
                    padding: TSizes.sm * 1.4,
                    isNetworkImage: isNetworkImage,
                    backgroundColor: backgroundColor,
                    overlayColor: THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.light,
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
          
              //text
              SizedBox(
                width: 55,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium!.apply(color: dark ? TColors.dark : TColors.light),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
    );
  }
}