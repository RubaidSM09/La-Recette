import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/recepie/controllers/recipe/reviews_ratings_controller.dart';

import '../../controllers/recipe/reviews_ratings_controller.dart';

class RatingsAndReviewsScreen extends StatelessWidget {
  final String recipeId;

  const RatingsAndReviewsScreen({
    super.key,
    required this.recipeId,
  });

  @override
  Widget build(BuildContext context) {
    final ReviewsRatingsController _controller = Get.put(ReviewsRatingsController(recipeId));

    return Scaffold(
      backgroundColor: Color(0xFFEAE7DC),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: CircleAvatar(
            backgroundColor: Color(0xFFEAE7DC),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Color(0xFFE85A4F)),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Ratings & Reviews',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Color(0xFF616161),
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
            () => _controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 29),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform(
                      transform: Matrix4.rotationZ(-0.03),
                      child: Container(
                        width: 120,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Color(0xFFE85A4F),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.rotationZ(-0.03),
                      child: Container(
                        width: 100,
                        height: 95,
                        decoration: BoxDecoration(
                          color: Color(0xFFEAE7DC),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.rotationZ(-0.03),
                      child: Container(
                        width: 90,
                        height: 85,
                        decoration: BoxDecoration(
                          color: Color(0xFFE85A4F),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color(0xFFEAE7DC),
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: _controller.ratingController,
                        decoration: InputDecoration(
                          hintText: 'Rate \nout of 5',
                          hintStyle: TextStyle(
                            height: 1.5,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Color(0xFFE85A4F),
                          ),
                          border: InputBorder.none,
                        ),
                        maxLines: 2,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Color(0xFFE85A4F),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 27),
                ElevatedButton(
                  onPressed: () => _controller.submitRating(context),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE85A4F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 59),
                TextField(
                  controller: _controller.reviewController,
                  decoration: InputDecoration(
                    hintText: 'Add a review',
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      color: Color(0xFF737373),
                    ),
                    filled: true,
                    fillColor: Color(0xFFF9F9F9),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF4B4B4B)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.check_circle, color: Color(0xFFE85A4F)),
                      onPressed: () => _controller.submitReview(context),
                    ),
                  ),
                ),
                SizedBox(height: 17),
                Divider(color: Color(0xFFE85A4F)),
                SizedBox(height: 13),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Ratings by people',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Color(0xFF565555),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ..._controller.reviews.map((review) {
                  return Column(
                    children: [
                      _buildReviewTile(
                        name: review.username.value,
                        review: review.review.value,
                        rating: review.rating.value,
                      ),
                      Divider(color: Color(0xFFE85A4F)),
                    ],
                  );
                }).toList(),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Color(0xFF565555),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReviewTile({
    required String name,
    required String review,
    required double rating,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            radius: 16,
            child: Icon(Icons.person, color: Colors.white),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xFF616161),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  review,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    color: Color(0xFF616161),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8),
          Column(
            children: [
              Icon(Icons.star, color: Color(0xFFFEA801), size: 14),
              Text(
                rating.toStringAsFixed(2),
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xFF787878),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
