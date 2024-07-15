import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/recepie/models/review_model.dart';

class ReviewsRatingsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<RatingReviewModel>> fetchReviews(String recipeId) async {
    print("Fetching reviews for recipeId: $recipeId");
    final snapshot = await _firestore.collection('recipes').doc(recipeId).get();
    print("Snapshot data: ${snapshot.data()}");

    List<dynamic> ratingReviews = snapshot.data()?['RatingReview'] ?? [];
    print("RatingReviews data: $ratingReviews");

    return ratingReviews.map((review) {
      print("Review item: $review");
      return RatingReviewModel.fromJson(review as Map<String, dynamic>);
    }).toList();
  }

  Future<void> submitReview(
      String recipeId,
      double rating,
      String reviewText,
      String username,
      ) async {
    print("Submitting review for recipeId: $recipeId");
    final snapshot = await _firestore.collection('recipes').doc(recipeId).get();

    if (snapshot.exists) {
      List<dynamic> ratingReviews = snapshot.data()?['RatingReview'] ?? [];
      ratingReviews.add({
        'Rating': rating,
        'Review': reviewText,
        'Username': username,
      });

      double totalRating = ratingReviews.fold(0.0, (sum, item) {
        final itemMap = item as Map<String, dynamic>;
        return sum + (itemMap['Rating'] as double);
      }) / ratingReviews.length;

      await _firestore.collection('recipes').doc(recipeId).update({
        'RatingReview': ratingReviews,
        'Ratings': totalRating,
      });
      print("Review submitted successfully");
    } else {
      print("Document does not exist");
    }
  }
}
