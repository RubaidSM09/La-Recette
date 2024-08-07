import 'package:flutter/cupertino.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/features/recepie/screens/home/widgets/home_appbar.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TVerticalProductShimmer extends StatelessWidget {
  const TVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            Expanded(
              child: TShimmerEffect(width: 180, height: 180),
            ),
            SizedBox(height: TSizes.spaceBtwItems),

            /// Text
            Expanded(
              child: TShimmerEffect(width: 160, height: 15),
            ),
            SizedBox(height: TSizes.spaceBtwItems / 2),
            Expanded(
              child: TShimmerEffect(width: 110, height: 15),
            ),
          ],
        ),
      ),
    );
  }
}
