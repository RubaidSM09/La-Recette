import 'package:cloud_firestore/cloud_firestore.dart';

class RecipeReviewRatingModel {
  String id;
  final double rating;
  final String review;
  final String username;

  RecipeReviewRatingModel({
    required this.id,
    required this.rating,
    required this.review,
    required this.username,
  });

  /// Create Empty func for clean code
  static RecipeReviewRatingModel empty() => RecipeReviewRatingModel(id: '', rating: 0.00, review: '', username: '');

  /// Json Format
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Rating': rating,
      'Review': review,
      'Username': username,
    };
  }

  factory RecipeReviewRatingModel.fromMap(Map<String, dynamic> data) {
    return RecipeReviewRatingModel(
      id: data['Id'] as String,
      rating: data['Rating'] as double,
      review: data['Review'] as String,
      username: data['Username'] as String,
    );
  }

  // Factory constructor to create an AddressModel from a DocumentSnapshot
  factory RecipeReviewRatingModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return RecipeReviewRatingModel(
      id: snapshot.id,
      rating: double.parse((data['Rating'] ?? 0.00).toString()),
      review: data['Review'] ?? '',
      username: data['Username'] ?? '',
    );
  }
}