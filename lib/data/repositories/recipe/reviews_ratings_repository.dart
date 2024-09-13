import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/features/recepie/models/recipe_review_rating_model.dart';

class ReviewsRatingsRepository extends GetxController {
  static ReviewsRatingsRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<RecipeReviewRatingModel>> fetchUserReviews(String recipeId) async {
    try {
      if (recipeId.isEmpty) throw 'Unable to find user information. Try again in few minutes.';

      final result = await _db.collection('recipe').doc(recipeId).collection('ReviewsRatings').get();
      return result.docs.map((documentSnapshot) => RecipeReviewRatingModel.fromDocumentSnapshot(documentSnapshot)).toList();

    } catch (e) {
      throw 'Something went wrong while fetching Address Information. Try again later';
    }
  }

  /// Store new user order
  Future<String> addReviewRating(RecipeReviewRatingModel reviewRating, String recipeId) async {
    try {
      final currentAddress = await _db.collection('recipe').doc(recipeId).collection('ReviewsRatings').add(reviewRating.toJson());
      return currentAddress.id;
    } catch (e) {
      throw 'Something went wrong while saving Address Information. Try again later';
    }
  }
}
