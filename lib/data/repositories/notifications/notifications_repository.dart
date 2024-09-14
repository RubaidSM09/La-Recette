import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/recepie/models/notifications_model.dart';
import 'package:t_store/features/recepie/models/recipe_review_rating_model.dart';

class NotificationsRepository extends GetxController {
  static NotificationsRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<NotificationsModel>> fetchNotificationsOfUser(String userId) async {
    try {
      if (userId.isEmpty) throw 'Unable to find notification. Try again in few minutes.';

      final result = await _db.collection('Users').doc(userId).collection('Notifications').orderBy('Time', descending: true).get();
      return result.docs.map((documentSnapshot) => NotificationsModel.fromDocumentSnapshot(documentSnapshot)).toList();

    } catch (e) {
      throw 'Something went wrong while fetching Address Information. Try again later';
    }
  }

  Future<List<NotificationsModel>> fetchUnreadNotificationsOfUser(String userId) async {
    try {
      if (userId.isEmpty) throw 'Unable to find notification. Try again in few minutes.';

      final result = await _db.collection('Users').doc(userId).collection('Notifications').where('IsRead', isEqualTo: false).get();
      return result.docs.map((documentSnapshot) => NotificationsModel.fromDocumentSnapshot(documentSnapshot)).toList();

    } catch (e) {
      throw 'Something went wrong while fetching Address Information. Try again later';
    }
  }

  Future<List<NotificationsModel>> fetchUnvisitedNotificationsOfUser(String userId) async {
    try {
      if (userId.isEmpty) throw 'Unable to find notification. Try again in few minutes.';

      final result = await _db.collection('Users').doc(userId).collection('Notifications').where('IsVisited', isEqualTo: false).get();
      return result.docs.map((documentSnapshot) => NotificationsModel.fromDocumentSnapshot(documentSnapshot)).toList();

    } catch (e) {
      throw 'Something went wrong while fetching Address Information. Try again later';
    }
  }

  /// Store new user order
  Future<void> addNotifications(NotificationsModel notification, String userId) async {
    try {
      final notificationSend = await _db.collection('Users').doc(userId).collection('Notifications').add(notification.toJson());
      // return currentAddress.id;
    } catch (e) {
      throw 'Something went wrong while saving Address Information. Try again later';
    }
  }

  Future<void> updateIsRead(
      String notificationsId,
      ) async {
    try {
      await _db.collection('Users').doc(UserController.instance.user.value.id).collection('Notifications').doc(notificationsId).update({
        'IsRead': true,
      });
    } catch (e) {
      throw 'Error adding recipe: $e';
    }
  }

  Future<void> updateIsVisited(
      NotificationsModel notification,
      ) async {
    try {
      await _db.collection('Users').doc(UserController.instance.user.value.id).collection('Notifications').doc(notification.id).update({
        'IsVisited': true,
      });
    } catch (e) {
      throw 'Error adding recipe: $e';
    }
  }
}
