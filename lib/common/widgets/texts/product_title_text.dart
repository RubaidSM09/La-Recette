import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductTitleText extends StatelessWidget {
  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;
  const TProductTitleText({
    super.key,
    required this.title,
    this.smallSize=false,
    this.maxLines=2,
    this.textAlign=TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Text(
      title,
      style:smallSize? Theme.of(context).textTheme.labelLarge!.apply(color: dark ? TColors.light : TColors.dark):Theme.of(context).textTheme.titleSmall!.apply(color: dark ? TColors.light : TColors.dark),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}