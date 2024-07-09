import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:t_store/features/recepie/controllers/recipe/addrecipe_ingredients_controller.dart';
import 'confirmationRecipe.dart'; // Import the ConfirmationPage

class AddProcedureScreen extends StatefulWidget {
  const AddProcedureScreen({super.key});

  @override
  _AddProcedureScreenState createState() => _AddProcedureScreenState();
}

class _AddProcedureScreenState extends State<AddProcedureScreen> {
  final AddIngredientsController _controller = Get.put(AddIngredientsController());
  File? _image;

  @override
  void initState() {
    super.initState();
    _controller.addIngredient(); // Add initial ingredient field
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      _controller.imageUrl.value = _image!.path;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final List<String> categories = ["burger", "pizza", "Turkish", "Mexican", "snacks", "dessert"];
    String selectedCategory = categories[0];

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          color: const Color(0xFFEAE7DC),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Color(0xFFE85A4F)),
                    onPressed: () {},
                  ),
                  title: const Center(
                    child: Text(
                      'Add New Recipe',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFF616161),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      width: 150,
                      height: 147,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(10),
                        image: _image != null
                            ? DecorationImage(
                          image: FileImage(_image!),
                          fit: BoxFit.cover,
                        )
                            : null,
                      ),
                      child: _image == null
                          ? Icon(Icons.add_a_photo, color: Color(0xFFE85A4F), size: 50)
                          : null,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: _pickImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE85A4F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      '+ Add Image',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xFFEAE7DC),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Name of the Recipe',
                    filled: true,
                    fillColor: Color(0xFFF5F5F5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) => _controller.recipeName.value = value,
                ),
                SizedBox(height: 16),
                Text(
                  'Cooking Time',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xFF565555),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF5F5F5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Hrs',
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        onChanged: (value) => _controller.cookingTimeHours.value = value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        ':',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: 48,
                          color: Color(0xFFE85A4F),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF5F5F5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Mins',
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        onChanged: (value) => _controller.cookingTimeMinutes.value = value,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Servings:',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xFF565555),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF5F5F5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (value) => _controller.servings.value = value,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Category:',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xFF565555),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFE85A4F),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        value: selectedCategory,
                        items: categories.map((String category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          _controller.category.value = newValue!;
                        },
                        hint: Text('Category'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Description:',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xFF565555),
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF5F5F5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) => _controller.description.value = value,
                ),
                SizedBox(height: 16),
                Text(
                  'Ingredients',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xFF565555),
                  ),
                ),
                SizedBox(height: 8),
                Obx(
                      () => Column(
                    children: _controller.ingredients
                        .map((ingredient) => Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFF5F5F5),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'Ingredient',
                              ),
                              onChanged: (value) => ingredient.name.value = value,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFF5F5F5),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'Quantity',
                              ),
                              onChanged: (value) => ingredient.quantity.value = value,
                            ),
                          ),
                        ],
                      ),
                    ))
                        .toList(),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: _controller.addIngredient,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(16),
                    ),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Procedure',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xFF565555),
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF5F5F5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) => _controller.procedure.value = value,
                ),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _controller.submitRecipe();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ConfirmationPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      'Request Approval',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Color(0xFFEAE7DC),
                      ),
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
}
