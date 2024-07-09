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

  static RecipeModel empty() => RecipeModel(id: '', title: '', chef: '', time: '', thumbnail: '');

  Map<String, dynamic> toJson() {
    return {
      'Title': title,
      'Chef': chef,
      'Time': time,
      'Image': thumbnail,
    };
  }

  factory RecipeModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return RecipeModel(
      id: document.id,
      title: data['Title'] ?? '',
      chef: data['Chef'] ?? '',
      time: data['Time'] ?? '',
      thumbnail: data['Image'] ?? '',
    );
  }

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
