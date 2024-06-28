import 'package:flutter/material.dart';
// import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
// import 'package:t_store/features/shop/controllers/all_products_controller.dart';
// import 'package:t_store/features/shop/models/product_model.dart';


class SortableProducts extends StatelessWidget {
  const SortableProducts({super.key,});

  // final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    // Initialize controller for managing product sorting
    // final controller = Get.put(AllProductsController());
    // controller.assignProducts(products);
    // return Column(children: [
    //   DropdownButtonFormField(
    //     decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
    //     value: controller.selectedSortOption.value,
    //     onChanged: (value) {
    //       // Sort products based on the selected option
    //       controller.sortProducts(value!);
    //     },
    //     items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Popularity']
    //         .map((option) =>
    //         DropdownMenuItem(value: option, child: Text(option)))
    //         .toList(),
    //   ),
    //   const SizedBox(
    //     height: TSizes.spaceBtwSections,
    //   ),
    //
    //   /// Products
    //   Obx(() => TGridLayout(
    //       itemCount: controller.products.length, itemBuilder: (_, index) => TProductCardVertical(product: controller.products[index]))),
    // ]);
    return Container(color: Colors.brown,);
  }
}