import 'package:cloud_firestore/cloud_firestore.dart';

class IngredientModel {
  String id;
  String title;
  String thumbnail;
  
  IngredientModel({
    required this.id,
    required this.title,
    required this.thumbnail,
  });

  /// Create Empty func for clean code
  static IngredientModel empty() => IngredientModel(id: '', title: '', thumbnail: '');

  /// Json Format
  toJson() {
    return {
      'Title': title,
      'Thumbnail': thumbnail,
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory IngredientModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if(document.data() == null) return IngredientModel.empty();
    final data = document.data()!;
    return IngredientModel(
      id: document.id,
      title: data['Title'],
      thumbnail: data['Thumbnail'] ?? '',
    );
  }

  /// Map Json-oriented document snapshot from Firebase to Model
  factory IngredientModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return IngredientModel(
      id: document.id,
      title: data['Title'] ?? '',
      thumbnail: data['Thumbnail'] ?? '',
    );
  }
}