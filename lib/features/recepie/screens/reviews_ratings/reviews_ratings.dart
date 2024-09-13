import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/recepie/controllers/recipe/reviews_ratings_controller.dart';
import 'package:t_store/features/recepie/models/recipe_model.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';


class RatingsAndReviewsScreen extends StatelessWidget {
  final RecipeModel recipe;

  const RatingsAndReviewsScreen({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReviewsRatingsController());

    return Scaffold(
      backgroundColor: const Color(0xFFEAE7DC),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: CircleAvatar(
            backgroundColor: const Color(0xFFEAE7DC),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFFE85A4F)),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
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
            () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 29),
                Form(
                  key: controller.reviewRatingFormKey,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Transform(
                            transform: Matrix4.rotationZ(-0.03),
                            child: Container(
                              width: 120,
                              height: 110,
                              decoration: const BoxDecoration(
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
                              decoration: const BoxDecoration(
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
                              decoration: const BoxDecoration(
                                color: Color(0xFFE85A4F),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 45,
                            decoration: const BoxDecoration(
                              color: Color(0xFFEAE7DC),
                            ),
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: controller.ratingController,
                              decoration: const InputDecoration(
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
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Color(0xFFE85A4F),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 27),
                      TextField(
                        controller: controller.reviewController,
                        decoration: InputDecoration(
                          hintText: 'Add a review',
                          hintStyle: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: Color(0xFF737373),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF9F9F9),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFF4B4B4B)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.check_circle, color: Color(0xFFE85A4F)),
                            onPressed: () => {},
                          ),
                        ),
                      ),
                      const SizedBox(height: 17),
                      ElevatedButton(
                        onPressed: () {
                          controller.recipeId.value = recipe.id;
                          controller.addReviewsRatings();
                          Get.to(() => RatingsAndReviewsScreen(recipe: recipe));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE85A4F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 59),
                const Divider(color: Color(0xFFE85A4F)),
                const SizedBox(height: 13),
                const Align(
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
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder(
                    key: Key(controller.refreshData.value.toString()),
                    future: controller.getAllUserReviews(recipe.id),
                    builder: (context, snapshot) {

                      /// Helper function: Handle Loader, No Record, OR ERROR Message
                      final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                      if (response != null) return response;

                      final reviews = snapshot.data!;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: reviews.length,
                        itemBuilder: (_, index) => _buildReviewTile(
                            name: reviews[index].username,
                            review: reviews[index].review,
                            rating: reviews[index].rating,
                          ),
                      );
                    }
                  ),
                ),
                const Divider(color: Color(0xFFE85A4F)),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {},
                  child: const Text(
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
            child: const Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xFF616161),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  review,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    color: Color(0xFF616161),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            children: [
              const Icon(Icons.star, color: Color(0xFFFEA801), size: 14),
              Text(
                rating.toStringAsFixed(2),
                style: const TextStyle(
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
