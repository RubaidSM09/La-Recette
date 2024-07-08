import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/recepie/models/recipe_model.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key, required this.recipe});

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 351,
            height: 1330,
            color: const Color(0xFFEAE7DC),
            child: Stack(
              children: [
                // Header image
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: 360,
                    height: 244,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(recipe.thumbnail),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // Title
                Positioned(
                  top: 257,
                  left: 12,
                  child: Text(
                    recipe.title,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 1.5,
                      color: Color(0xFFE85A4F),
                    ),
                  ),
                ),
                // Chef's name
                Positioned(
                  top: 280,
                  left: 12,
                  child: Text(
                    recipe.chef,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      height: 1.5,
                      color: Color(0xFF616161),
                    ),
                  ),
                ),
                // Cooking Time and Rating
                Positioned(
                  top: 300,
                  left: 12,
                  child: Row(
                    children: [
                      const Icon(Icons.timer, color: Color(0xFFFF7900), size: 12),
                      const SizedBox(width: 4),
                      Text(
                        recipe.time,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                          fontSize: 9,
                          height: 1.5,
                          color: Color(0xFF616161),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.star, color: Color(0xFFFEA801), size: 12),
                      const SizedBox(width: 4),
                      Text(
                        '4.7',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                          fontSize: 9,
                          height: 1.5,
                          color: Color(0xFF616161),
                        ),
                      ),
                    ],
                  ),
                ),
                // Servings and Reviews & Ratings
                Positioned(
                  top: 317,
                  left: 12,
                  right: 12,  // Add this to right-align the reviews & ratings section
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Space between servings and reviews & ratings
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Servings:',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              height: 1.5,
                              color: Color(0xFFE85A4F),
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            '4',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              height: 1.5,
                              color: Color(0xFF565555),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Reviews & Ratings',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              height: 1.5,
                              color: Color(0xFF565555),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_forward, size: 16),
                            onPressed: () {
                              // Add your onPressed code here
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Description Section
                const Positioned(
                  top: 347,
                  left: 12,
                  child: Text(
                    'Description',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      height: 1.5,
                      color: Color(0xFF616161),
                    ),
                  ),
                ),
                Positioned(
                  top: 368,
                  left: 7,
                  child: Container(
                    width: 332,
                    height: 98,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(2, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'These burger patties are made with ground beef and an easy bread crumb mixture. Nothing beats a simple hamburger on a warm summer evening. Pile these burgers with your favorite condiments and pop open a cool drink!',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                          fontSize: 11,
                          height: 1.5,
                          color: Colors.black.withOpacity(0.72),
                        ),
                      ),
                    ),
                  ),
                ),
                // Ingredients Section
                const Positioned(
                  top: 490,
                  left: 12,
                  child: Text(
                    'Ingredients',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      height: 1.5,
                      color: Color(0xFF616161),
                    ),
                  ),
                ),
                Positioned(
                  top: 511,
                  left: 12,
                  child: Container(
                    width: 332,
                    height: 226,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(2, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildIngredientRow('Fine dry bread crumbs', '1/2 cup'),
                          buildIngredientRow('Salt', '1/2 tsp'),
                          buildIngredientRow('Ground beef', '1 pound'),
                          buildIngredientRow('Egg', '2 pcs'),
                          buildIngredientRow('Pepper', '1/2 tsp'),
                        ],
                      ),
                    ),
                  ),
                ),
                // Directions Section
                const Positioned(
                  top: 757,
                  left: 12,
                  child: Text(
                    'Directions',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      height: 1.5,
                      color: Color(0xFF616161),
                    ),
                  ),
                ),
                Positioned(
                  top: 779,
                  left: 12,
                  child: Container(
                    width: 330,
                    height: 487,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(2, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '1. Preheat an outdoor grill for high heat and lightly oil grate.\n'
                            '2. Whisk together egg, salt, and pepper in a medium bowl.\n'
                            '3. Add ground beef and bread crumbs and mix with your hands or a fork until well blended.\n'
                            '4. Form into four 3/4-inch-thick patties.\n'
                            '5. Place patties on the preheated grill. Cover and cook 6 to 8 minutes per side, or to desired doneness. An instant-read thermometer inserted into the center should read at least 160 degrees F (70 degrees C).\n'
                            '6. Serve hot and enjoy!',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          height: 1.5,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ),
                ),
                // Reviews & Ratings Section
                Positioned(
                  top: 1277,
                  left: 12,
                  child: Row(
                    children: [
                      const Text(
                        'Reviews & Ratings',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          height: 1.5,
                          color: Color(0xFF565555),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward, size: 16),
                        onPressed: () {
                          // Add your onPressed code here
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIngredientRow(String ingredient, String quantity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ingredient,
            style: const TextStyle(fontSize: 12),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              quantity,
              style: const TextStyle(fontSize: 12, color: Color(0xFFE85A4F)),
            ),
          ),
        ],
      ),
    );
  }
}
