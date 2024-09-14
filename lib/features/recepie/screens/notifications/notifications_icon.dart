import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/recepie/controllers/notifications_controller.dart';
// import 'package:t_store/features/shop/controllers/product/cart_controller.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

// import '../../../../features/shop/screens/cart/cart.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../personalization/controllers/user_controller.dart';
import 'notifications.dart';

class NotificationCounterIcon extends StatelessWidget {

  const NotificationCounterIcon({
    super.key,
    this.iconColor,
    this.counterBgColor,
    this.counterTextColor,
  });

  final Color? iconColor,counterBgColor,counterTextColor;

  @override
  Widget build(BuildContext context) {

    //Get an instance of the CartController
    final controller=NotificationsController.instance;
    final userController = UserController.instance;

    final dark=THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            for(int i=0;i<controller.unreadNotifications.length;i++){
              controller.updateAfterReading(controller.unreadNotifications[i].id.toString());
            }
            Get.to(() => NotificationsPage(user: FirebaseAuth.instance.currentUser!.uid));
          },
          icon: Icon(
            Iconsax.notification,
            color: iconColor,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: counterBgColor ??(dark ? TColors.white : TColors.black),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: FutureBuilder(
                  key: Key(controller.refreshData.value.toString()),
                  future: controller.getUnreadNotificationsOfUser(FirebaseAuth.instance.currentUser!.uid),
                  builder: (context, snapshot) {

                    /// Helper function: Handle Loader, No Record, OR ERROR Message
                    final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                    if (response != null) return response;

                    final notifications = snapshot.data!;
                    return Text(
                      notifications.length.toString(),
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                        color: counterTextColor ??(dark ? TColors.black : TColors.white),
                        fontSizeFactor: 0.8,
                      ),
                    );
                  }
              ),
              // Obx(
                    // () =>
              ),
            ),
          ),
      ],
    );
  }
}