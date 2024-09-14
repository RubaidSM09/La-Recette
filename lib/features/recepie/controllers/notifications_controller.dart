import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loader/loaders.dart';
import 'package:t_store/data/repositories/recipe/addrecipe_ingredients_repository.dart';
import 'package:t_store/data/repositories/recipe/reviews_ratings_repository.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/recepie/models/recipe_review_rating_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

import '../../../data/repositories/notifications/notifications_repository.dart';
import '../models/notifications_model.dart';

class NotificationsController extends GetxController {
  static NotificationsController get instance => Get.find();
  final controller = Get.put(UserController());
  var isLoading = false.obs;

  RxList<NotificationsModel> unreadNotifications = <NotificationsModel>[].obs;
  RxList<NotificationsModel> unVisitedNotifications = <NotificationsModel>[].obs;

  var userId = ''.obs;
  GlobalKey<FormState> reviewRatingFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final notificationsRepository = Get.put(NotificationsRepository());
  // final addRecipeIngredientRepository = Get.put(AddIngredientsRepository());

  /// Fetch all user specific addresses
  Future<List<NotificationsModel>> getAllNotificationsOfUser(String id) async {
    try {
      userId.value = id;
      final notifications = await notificationsRepository.fetchNotificationsOfUser(userId.value);
      return notifications;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  /// Fetch all user specific addresses
  Future<List<NotificationsModel>> getUnreadNotificationsOfUser(String id) async {
    try {
      userId.value = id;
      final notifications = await notificationsRepository.fetchUnreadNotificationsOfUser(userId.value);
      unreadNotifications.assignAll(notifications);
      return notifications;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  Future<List<NotificationsModel>> getUnvisitedNotificationsOfUser(String id) async {
    try {
      userId.value = id;
      final notifications = await notificationsRepository.fetchUnvisitedNotificationsOfUser(userId.value);
      unVisitedNotifications.assignAll(notifications);
      return notifications;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  /// Send Notifications
  Future sendNotifications(String title, String type, String path, String image, String userId) async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Starting Address...', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save Address Data
      final notification = NotificationsModel(
        time: Timestamp.now(),
        title: title,
        type: type,
        path: path,
        image: image,
        isRead: false,
        isVisited: false,
      );
      await notificationsRepository.addNotifications(notification, userId);
      // updateRatings(recipeId.value);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      if(path=="Recipe Pending" || path=="Blog Pending"){
        TLoaders.successSnackBar(title: 'Congratulations', message: 'Your request has been sent successfully.');
      }

      // Refresh Addresses Data
      refreshData.toggle();

      // Reset fields
      // resetFormFields();

      // Redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
    }
  }

  void updateAfterReading(String id) async {
    try {
      await notificationsRepository.updateIsRead(id);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
    }
  }

  void updateAfterVisiting(NotificationsModel notification) async {
    try {
      await notificationsRepository.updateIsVisited(notification);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
    }
  }
}
