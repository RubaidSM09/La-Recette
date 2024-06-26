// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';


class TRoundedImage extends StatelessWidget {
  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  const TRoundedImage({
    super.key,
    this.border,
    this.padding,
    this.onPressed,
    required this.imageUrl,
    this.borderRadius = TSizes.md,
    this.width,
    this.height,
    this.applyImageRadius = false,
    this.backgroundColor = TColors.light,
    this.fit = BoxFit.contain,
    this.isNetworkImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
          child:
          // isNetworkImage
          //   ? CachedNetworkImage(
          //   fit: fit,
          //   imageUrl: imageUrl,
          //   progressIndicatorBuilder: (context,url,downloadProgress) =>
          //     TShimmerEffect(width: width ?? double.infinity, height: height ??158),
          //   errorWidget: (context,url,error) =>const Icon(Icons.error),
          // )
          //     :
          Image(
            fit: fit,
            image: AssetImage(imageUrl),
          ),
        ),
      ),
    );
  }
}