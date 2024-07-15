import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_store/features/recepie/models/review_model.dart';
import 'package:t_store/data/repositories/recipe/reviews_ratings_repository.dart';

class ReviewsRatingsController extends GetxController {
  final String recipeId;
  var reviews = <RatingReviewModel>[].obs;
  var isLoading = true.obs;
  final ratingController = TextEditingController();
  final reviewController = TextEditingController();

  ReviewsRatingsController(this.recipeId) {
    fetchReviews();
  }

  Future<void> fetchReviews() async {
    try {
      print("Fetching reviews for recipeId: $recipeId");
      reviews.value = await ReviewsRatingsRepository().fetchReviews(recipeId);
      print("Fetched reviews: ${reviews.length}");
      for (var review in reviews) {
        print("Review: ${review.username}, ${review.review}, ${review.rating}");
      }
    } catch (e) {
      print('Error fetching reviews: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> submitRating(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username') ?? 'Anonymous';

    double rating = double.tryParse(ratingController.text) ?? 0;
    String reviewText = reviewController.text;

    if (rating <= 0 || reviewText.isEmpty) {
      _showErrorDialog(context, 'Please provide a valid rating and review');
      return;
    }

    try {
      await ReviewsRatingsRepository().submitReview(recipeId, rating, reviewText, username);
      fetchReviews();
      _showThankYouDialog(context, 'Thank you for rating our recipe');
    } catch (e) {
      print('Error submitting rating: $e');
      _showErrorDialog(context, 'Error submitting rating');
    }
  }

  Future<void> submitReview(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username') ?? 'Anonymous';

    double rating = double.tryParse(ratingController.text) ?? 0;
    String reviewText = reviewController.text;

    if (rating <= 0 || reviewText.isEmpty) {
      _showErrorDialog(context, 'Please provide a valid rating and review');
      return;
    }

    try {
      await ReviewsRatingsRepository().submitReview(recipeId, rating, reviewText, username);
      fetchReviews();
      _showThankYouDialog(context, 'Thank you for giving your valuable review');
    } catch (e) {
      print('Error submitting review: $e');
      _showErrorDialog(context, 'Error submitting review');
    }
  }

  void _showThankYouDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Color(0xFF616161),
            ),
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Done',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xFFE85A4F),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Text(
            'Error',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Color(0xFF616161),
            ),
          ),
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF616161),
            ),
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Close',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xFFE85A4F),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
