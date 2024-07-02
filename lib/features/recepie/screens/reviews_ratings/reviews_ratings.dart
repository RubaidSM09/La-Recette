import 'package:flutter/material.dart';


class RatingsAndReviewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAE7DC),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: CircleAvatar(
            backgroundColor: Color(0xFFEAE7DC),
            child: Icon(Icons.arrow_back, color: Color(0xFFE85A4F)),
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
      body: SingleChildScrollView(
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
                      width: 97,
                      height: 88,
                      decoration: BoxDecoration(
                        color: Color(0xFFE85A4F),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.rotationZ(-0.03),
                    child: Container(
                      width: 82,
                      height: 75,
                      decoration: BoxDecoration(
                        color: Color(0xFFEAE7DC),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.rotationZ(-0.03),
                    child: Container(
                      width: 71,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Color(0xFFE85A4F),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Container(
                    width: 44,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Color(0xFFEAE7DC),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Rate\nout of 5',
                        hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Color(0xFFE85A4F),
                        ),
                        border: InputBorder.none,
                      ),
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
                onPressed: () {},
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF565555),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 59),
              TextField(
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
                  suffixIcon: Icon(Icons.check_circle, color: Color(0xFFE85A4F)),
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
              _buildReviewTile(
                name: 'Alisha Kabir',
                review: 'very impressive recipe, easy to use',
                rating: 4.73,
              ),
              Divider(color: Color(0xFFE85A4F)),
              _buildReviewTile(
                name: 'Rubaid Sharif',
                review: 'Yummy yummy full tummy',
                rating: 4.24,
              ),
              Divider(color: Color(0xFFE85A4F)),
              _buildReviewTile(
                name: 'Zarif Zeisan',
                review: 'Ingredients specially gourmet beef is a bit expensive, there could be a substitute like chicken',
                rating: 3.73,
              ),
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
