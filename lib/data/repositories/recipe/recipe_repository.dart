import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/recepie/models/recipe_model.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class RecipeRepository extends GetxController {
  static RecipeRepository get instance => Get.find();

  /// Firestore instance for database interactions.
  final _db = FirebaseFirestore.instance;

  /// Get all recipes
  Future<List<RecipeModel>> getAllRecipes() async {
    try {
      final snapshot = await _db.collection('recipe').get();
      return snapshot.docs.map((e) => RecipeModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get Products based on the Brand
  Future<List<RecipeModel>> getFavouriteRecipes(List<String> recipeIds) async {
    try {
      final snapshot = await _db.collection('recipe').where(FieldPath.documentId,whereIn: recipeIds).get();
      return snapshot.docs.map((querySnapshot) => RecipeModel.fromSnapshot(querySnapshot)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}