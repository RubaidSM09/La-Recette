import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';


class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context).textTheme.labelMedium!.apply(color: dark ? TColors.dark : const Color(0xFFE85A4F)),
          ),
          Text(
            TTexts.homeAppbarSubTitle,
            style: Theme.of(context).textTheme.headlineSmall!.apply(color: dark ? TColors.dark : const Color(0xFFE85A4F)),
          ),
        ],
      ),
    );
  }
}

class TShimmerEffect extends StatelessWidget{
  const TShimmerEffect({
    Key? key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
  }) : super(key:key);
  final double width,height,radius;
  final Color? color;

  @override
  Widget build(BuildContext context){
    final dark =THelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
        baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
        highlightColor: dark ? Colors.grey[700]! : Colors.grey[1001]!,
        child: Container(
          width: width,
          height: height,
          decoration:BoxDecoration(
            color: color ?? (dark ? TColors.darkerGrey : TColors.white),
            borderRadius: BorderRadius.circular(radius),
          ),
        )
    );
  }
}