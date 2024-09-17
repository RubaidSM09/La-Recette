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
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/common/widgets/loader/loaders.dart';
import 'package:t_store/data/user/user_repository.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/change_name.dart';
import 'package:t_store/features/personalization/screens/profile/change_phone_number.dart';
import 'package:t_store/features/personalization/screens/profile/change_username.dart';
import 'package:t_store/features/personalization/screens/profile/change_email.dart';
import 'package:t_store/features/recepie/screens/home/widgets/home_appbar.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Information',
          style: TextStyle(
            color: dark ? TColors.dark : TColors.light,
          ),
        ),
        centerTitle: true,
        // backgroundColor: const Color(0xFFEAE7DC),
        elevation: 0,
      ),
      // backgroundColor: const Color(0xFFEAE7DC),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx((){
                      final networkImage=UserController.instance.user.value.profilePicture;
                      final image=networkImage.isNotEmpty ? networkImage : TImages.user2;
                      return UserController.instance.imageUploading.value
                          ? const TShimmerEffect(width: 80,height: 80,radius: 80,)
                          :  TCircularImage(image: image,width: 150,height: 150,isNetworkImage: networkImage.isNotEmpty,);
                    }),
                    TextButton(onPressed: () => UserController.instance.uploadUserProfilePicture(), child: const Text('Change Profile Picture')),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  buildInfoRow(dark ? TColors.dark : TColors.light, 'Name', UserController.instance.user.value.fullName,
                      () => Get.to(() => const ChangeNameScreen())),
                  const SizedBox(height: 16.0),
                  buildInfoRow(dark ? TColors.dark : TColors.light, 'Username', UserController.instance.user.value.username,
                      () => Get.to(() => const ChangeUsernameScreen())),
                  const SizedBox(height: 16.0),
                  buildInfoRow(dark ? TColors.dark : TColors.light, 'Email', UserController.instance.user.value.email,
                      () => Get.to(() => const ChangeEmailScreen())),
                  const SizedBox(height: 16.0),
                  buildInfoRow(dark ? TColors.dark : TColors.light, 'Phone number', '${UserController.instance.user.value.phoneNumber.replaceRange(5, 11, '*')}*****',
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

Widget buildInfoRow(Color color, String label, String value, VoidCallback onEditPressed) {
  return Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(fontSize: 16, color: Color(0xFFE85A4F))),
            Text(value,
                style: TextStyle(
                    fontSize: 16,
                    color: color,
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

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName= TextEditingController();
  final lastName= TextEditingController();
  final phoneNumber= TextEditingController();
  final userController = UserController.instance;
  final userRepository= Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey =GlobalKey<FormState>();
  GlobalKey<FormState> updatePhoneNumberFormKey =GlobalKey<FormState>();

  //init user data when Home Screen appears
  @override
  void onInit(){
    initializeNames();
    super.onInit();
  }

  //Fetch user record
  Future<void> initializeNames() async{
    firstName.text=userController.user.value.firstName;
    lastName.text=userController.user.value.lastName;
    phoneNumber.text=userController.user.value.phoneNumber;
  }

  Future<void> updateUserName() async{
    try{
      //start loading
      TFullScreenLoader.openLoadingDialog('We are updating your information', TImages.docerAnimation);

      //Check Internet Connectivity
      final isConnected= await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }
      print(updateUserNameFormKey);

      //Form Validation
      if(!updateUserNameFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      //update user's first & last name in the Firebase Firestore
      Map<String, dynamic> name={'FirstName': firstName.text.trim(),'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      //update the Rx User value
      userController.user.value.firstName=firstName.text.trim();
      userController.user.value.lastName=lastName.text.trim();

      //Remove loader
      TFullScreenLoader.stopLoading();

      //show success message
      TLoaders.successSnackBar(title: 'Congratulations',message: 'Your name has been updates.');

      //Move to previous screen
      Get.off(() => const ProfileScreen());
    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }

  Future<void> updatePhoneNumber() async{
    try{
      //start loading
      TFullScreenLoader.openLoadingDialog('We are updating your information', TImages.docerAnimation);

      //Check Internet Connectivity
      final isConnected= await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }
      print(updatePhoneNumberFormKey);

      //Form Validation
      if(!updatePhoneNumberFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      //update user's first & last name in the Firebase Firestore
      Map<String, dynamic> phoneNum={'PhoneNumber': phoneNumber.text.trim()};
      await userRepository.updateSingleField(phoneNum);

      //update the Rx User value
      userController.user.value.phoneNumber=phoneNumber.text.trim();

      //Remove loader
      TFullScreenLoader.stopLoading();

      //show success message
      TLoaders.successSnackBar(title: 'Congratulations',message: 'Your phone number has been updates.');

      //Move to previous screen
      Get.off(() => const ProfileScreen());
    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }

}
