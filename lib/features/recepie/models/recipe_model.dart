import 'package:cloud_firestore/cloud_firestore.dart';

class RecipeModel {
  String id;
  String title;
  String chef;
  String time;
  String thumbnail;

  RecipeModel({
    required this.id,
    required this.title,
    required this.chef,
    required this.time,
    required this.thumbnail,
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
    );
  }
}