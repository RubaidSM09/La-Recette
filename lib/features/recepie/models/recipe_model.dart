import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/recepie/models/recipe_ingredients_model.dart';

class RecipeModel {
  String id;
  String title;
  String chef;
  String time;
  String thumbnail;
  double? ratings;
  int? servings;
  String? description;
  String? direction;
  List<RecipeIngredientModel>? ingredients;

  RecipeModel({
    required this.id,
    required this.title,
    required this.chef,
    required this.time,
    required this.thumbnail,
    this.ratings,
    this.servings,
    this.description,
    this.direction,
    this.ingredients,
  });

  /// Create Empty func for clean code
  static RecipeModel empty() => RecipeModel(id: '', title: '', chef: '', time: '', thumbnail: '');

  /// Json Format
  toJson() {
    return {
      'Title': title,
      'Chef': chef,
      'Time': time,
      'Image': thumbnail,
      'Ratings': ratings,
      'Servings': servings,
      'Description': description,
      'Directions': direction,
      'Ingredients': ingredients != null ? ingredients!.map((e) => e.toJson()).toList() : [],
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory RecipeModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if(document.data() == null) return RecipeModel.empty();
    final data = document.data()!;
    return RecipeModel(
      id: document.id,
      title: data['Title'],
      chef: data['Chef'],
      time: data['Time'] ?? '',
      thumbnail: data['Image'] ?? '',
      ratings: data['Ratings'] ?? '',
      servings: data['Servings'] ?? '',
      description: data['Description'] ?? '',
      direction: data['Directions'] ?? '',
      ingredients: (data['Ingredients'] as List<dynamic>).map((e) => RecipeIngredientModel.fromJson(e)).toList(),
    );
  }

  /// Map Json-oriented document snapshot from Firebase to Model
  factory RecipeModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return RecipeModel(
      id: document.id,
      title: data['Title'] ?? '',
      chef: data['Chef'] ?? '',
      time: data['Time'] ?? '',
      thumbnail: data['Image'] ?? '',
      ratings: data['Ratings'] ?? '',
      servings: data['Servings'] ?? '',
      description: data['Description'] ?? '',
      direction: data['Directions'] ?? '',
      ingredients: (data['Ingredients'] as List<dynamic>).map((e) => RecipeIngredientModel.fromJson(e)).toList(),
    );
  }
}