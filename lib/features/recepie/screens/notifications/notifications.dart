import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:t_store/features/personalization/models/user_models.dart';
import 'package:t_store/features/recepie/controllers/blog_controller.dart';
import 'package:t_store/features/recepie/controllers/notifications_controller.dart';
import 'package:t_store/features/recepie/models/notifications_model.dart';
import 'package:t_store/features/recepie/screens/blogs/add_blogs/add_blogs.dart';
import 'package:t_store/features/recepie/screens/blogs/widgets/blogCard.dart';
import 'package:t_store/features/recepie/screens/notifications/notifications_cart.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../utils/helpers/cloud_helper_functions.dart';
// import 'dart:html' as html;

class NotificationsPage extends StatelessWidget {
  final String user;

  const NotificationsPage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    final controller = NotificationsController.instance;
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: TAppBar(
        title: Text('Notifications', style: Theme.of(context).textTheme.headlineMedium!.apply(color: dark ? TColors.dark : const Color(0xFFE85A4F))),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: TSizes.defaultSpace),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: FutureBuilder(
                    key: Key(controller.refreshData.value.toString()),
                    future: controller.getAllNotificationsOfUser(user),
                    builder: (context, snapshot) {

                      /// Helper function: Handle Loader, No Record, OR ERROR Message
                      final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                      if (response != null) return response;

                      final notifications = snapshot.data!;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: notifications.length,
                        itemBuilder: (_, index) => NotificationsCard(
                          notifications: notifications[index],
                        ),
                      );
                    }
                ),

                ),
            ],
          ),
        ),
      ),
    );
  }
}

