import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/recepie/screens/blogs/add_blogs/add_blogs.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';


class AddIngredientsScreen extends StatelessWidget {
  const AddIngredientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const TAppBar(
        title: Text("Add New Ingredient"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
                        borderRadius: BorderRadius.circular(10),
                        ),
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Center(
                            child:
                            // isNetworkImage
                            // ? CachedNetworkImage(
                            //   fit: fit,
                            //   color: overlayColor,
                            //   imageUrl: image,
                            //   progressIndicatorBuilder: (context,url,downloadProcess) => const TShimmerEffect(width: 55, height: 55,radius: 55,),
                            //   errorWidget: (context,url,error) => const Icon(Icons.error),
                            // )
                            //
                            // :
                            Image(
                              fit: BoxFit.cover,
                              image:  const AssetImage(TImages.addIngredientsImage),
                              color: THelperFunctions.isDarkMode(context) ? TColors.dark : const Color(0xFFE85A4F),
                            ) ,
                          ),
                        )
                    ),
                    TextButton(onPressed: () {}, child: Text('+ Add Image', style: TextStyle(color: dark ? TColors.dark: const Color(0xFFE85A4F)),)),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems/2,),

              /// Name
              TextFormField(
                decoration:  InputDecoration(
                    filled: true, // This makes the field background white
                    fillColor: dark ? const Color(0xFF3A3A3A) : Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: dark ? TColors.dark : const Color(0xFFE85A4F)),
                      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    ),
                    labelText: 'Name',
                    labelStyle: TextStyle(color: dark ? TColors.dark : const Color(0xFFE85A4F))),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields,),

              /// Description
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: TextStyle(color: dark ? TColors.dark : const Color(0xFFE85A4F)),
                  filled: true, // This makes the field background white
                  fillColor: dark ? const Color(0xFF3A3A3A) : Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: dark ? TColors.dark : const Color(0xFFE85A4F)),
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              ///Sign in button
              SizedBox(
                  width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const AddBlogsScreen()), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE85A4F)), child: const Text('Add', style: TextStyle(color: TColors.dark),))
              ),
            ],
          ),
        ),
      ),
    );
  }
}
