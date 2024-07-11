import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/recepie/models/blog_model.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class BlogRepository extends GetxController {
  static BlogRepository get instance => Get.find();

  /// Firestore instance for database interactions.
  final _db = FirebaseFirestore.instance;

  /// Get approved blogs
  Future<List<BlogModel>> getApprovedBlogs() async {
    try {
      final snapshot = await _db.collection('Blogs').where('IsPending', isEqualTo: false).get();
      return snapshot.docs.map((e) => BlogModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get pending blogs
  Future<List<BlogModel>> getPendingBlogs() async {
    try {
      final snapshot = await _db.collection('Blogs').where('IsPending', isEqualTo: true).get();
      return snapshot.docs.map((e) => BlogModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Add blog
  Future<void> addBlog(String title, String author, String content, String? image) async {
    try {
      await _db.collection('Blogs').add({
        'Title': title,
        'Author': author,
        'Content': content,
        'Image': image,
        'IsPending': true,
      });
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Approve Blog
  Future<void> updateBlog(
      String blogId,
      ) async {
    try {
      await _db.collection('Blogs').doc(blogId).update({
        'IsPending': false,
      });
    } catch (e) {
      throw 'Error adding recipe: $e';
    }
  }

  Future<void> deleteBlog(
      String blogId,
      ) async {
    try {
      await _db.collection('Blogs').doc(blogId).delete();
    } catch (e) {
      throw 'Error adding recipe: $e';
    }
  }
}