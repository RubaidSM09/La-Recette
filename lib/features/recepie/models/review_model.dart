import 'package:get/get.dart';

class RatingReviewModel {
  RxString username;
  RxString review;
  RxDouble rating;

  RatingReviewModel({
    required this.username,
    required this.review,
    required this.rating,
  });

  Map<String, dynamic> toJson() {
    return {
      'Username': username.value,
      'Review': review.value,
      'Rating': rating.value,
    };
  }

  factory RatingReviewModel.fromJson(Map<String, dynamic> json) {
    return RatingReviewModel(
      username: (json['Username'] ?? '').obs,
      review: (json['Review'] ?? '').obs,
      rating: (json['Rating'] ?? 0.0).obs,
    );
  }
}
