// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:t_store/common/widgets/appbar/appbar.dart';
// import 'package:t_store/common/widgets/images/t_circular_image.dart';
// import 'package:t_store/common/widgets/texts/section_heading.dart';
// import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
//
// import '../../../../utils/constants/image_strings.dart';
// import '../../../../utils/constants/sizes.dart';
//
// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const TAppBar(showBackArrow: true,title: Text('Profile'),),
//
//       ///Body
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(TSizes.defaultSpace),
//           child: Column(
//             children: [
//               ///Profile Picture
//               SizedBox(
//                 width: double.infinity,
//                 child: Column(
//                   children: [
//                     const TCircularImage(image: TImages.user,width: 80,height: 80,),
//                     TextButton(onPressed: (){}, child: const Text('Change Profile Picture')),
//                   ],
//                 ),
//               ),
//
//               ///Details
//               const SizedBox(height: TSizes.spaceBtwItems /2,),
//               const Divider(),
//               const SizedBox(height: TSizes.spaceBtwItems),
//               const TSectionHeading(title: 'Profile Information' , showActionButton: false,),
//               const SizedBox(height: TSizes.spaceBtwItems,),
//
//               TProfileMenu(title: 'Name',value: 'Flutter Group',onPressed: (){},),
//               TProfileMenu(title: 'Username',value: 'Flutter BrainStation',onPressed: (){},),
//
//               const SizedBox(height: TSizes.spaceBtwItems,),
//               const Divider(),
//               const SizedBox(height: TSizes.spaceBtwItems),
//
//               ///Heading Personal Info
//               const TSectionHeading(title: 'Personal Information',showActionButton: false,),
//               const SizedBox(height: TSizes.spaceBtwItems,),
//
//               TProfileMenu(title: 'User ID',value: '202114041',icon: Iconsax.copy,onPressed: (){},),
//               TProfileMenu(title: 'E-mail',value: 'flutter@gmail.com',onPressed: (){},),
//               TProfileMenu(title: 'Phone Number',value: '01757259665',onPressed: (){},),
//               TProfileMenu(title: 'Gender',value: 'Female',onPressed: (){},),
//               TProfileMenu(title: 'Date of Birth',value: '30 Jan, 2001',onPressed: (){},),
//               const Divider(),
//               const SizedBox(height: TSizes.spaceBtwItems,),
//
//               Center(
//                 child: TextButton(
//                   onPressed: (){},
//                   child: const Text('Close Account' , style: TextStyle(color: Colors.red),),
//                 ),
//               )
//
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/personalization/screens/profile/change_name.dart';
import 'package:t_store/features/personalization/screens/profile/change_phone_number.dart';
import 'package:t_store/features/personalization/screens/profile/change_username.dart';
import 'package:t_store/features/personalization/screens/profile/change_email.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile Information',
          style: TextStyle(
            color: Color(0xFFE85A4F),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFEAE7DC),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFEAE7DC),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 75,
                  backgroundImage:
                      AssetImage('assets/images/profile_images/chef_2.jpeg'),
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'Change Profile Picture',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFE85A4F),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  buildInfoRow('Name', 'Alex McWell',
                      () => Get.to(() => const ChangeNameScreen())),
                  const SizedBox(height: 16.0),
                  buildInfoRow('Username', '@alexmcwell',
                      () => Get.to(() => const ChangeUsernameScreen())),
                  const SizedBox(height: 16.0),
                  buildInfoRow('Email', 'alex@example.com',
                      () => Get.to(() => const ChangeEmailScreen())),
                  const SizedBox(height: 16.0),
                  buildInfoRow('Phone number', '+880179*******',
                      () => Get.to(() => const ChangeNumberScreen())),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildInfoRow(String label, String value, VoidCallback onEditPressed) {
  return Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(fontSize: 16, color: Color(0xFFE85A4F))),
            Text(value,
                style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF616161),
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      TextButton(
        onPressed: onEditPressed,
        child: const Text('Edit', style: TextStyle(color: Colors.grey)),
      ),
    ],
  );
}
