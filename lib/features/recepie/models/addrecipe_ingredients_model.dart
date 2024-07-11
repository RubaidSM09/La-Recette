import 'package:get/get.dart';

class RecipeIngredientModel {
  RxString name;
  RxString quantity;

  RecipeIngredientModel({required this.name, required this.quantity});

  Map<String, dynamic> toJson() {
    return {
      'Name': name.value,
      'Quantity': quantity.value,
    };
  }

  factory RecipeIngredientModel.fromJson(Map<String, dynamic> json) {
    return RecipeIngredientModel(
      name: (json['Name'] ?? '').obs,
      quantity: (json['Quantity'] ?? '').obs,
    );
  }
}

class ReviewsRatingModel {
  RxString name;
  RxDouble rating;
  RxString review;

  ReviewsRatingModel({required this.name, required this.rating, required this.review});

  Map<String, dynamic> toJson() {
    return {
      'Username': name.value,
      'Rating': rating.value,
      'Review': review.value,
    };
  }

  factory ReviewsRatingModel.fromJson(Map<String, dynamic> json) {
    return ReviewsRatingModel(
      name: (json['Username'] ?? '').obs,
      rating: (json['Rating'] ?? 0.00).obs,
      review: (json['Review'] ?? '').obs,
    );
  }
}
