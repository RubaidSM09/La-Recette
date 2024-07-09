import 'package:cloud_firestore/cloud_firestore.dart';

class BlogModel {
  String id;
  String title;
  String author;
  String content;
  String? image;

  BlogModel({
    required this.id,
    required this.title,
    required this.author,
    required this.content,
    this.image,
  });

  /// Create Empty func for clean code
  static BlogModel empty() => BlogModel(id: '', title: '', author: '', content: '');

  /// Json Format
  toJson() {
    return {
      'Title': title,
      'Author': author,
      'Content': content,
      'Image': image,
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory BlogModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if(document.data() == null) return BlogModel.empty();
    final data = document.data()!;
    return BlogModel(
      id: document.id,
      title: data['Title'],
      author: data['Author'],
      content: data['Content'],
      image: data['Image'] ?? '',
    );
  }

  /// Map Json-oriented document snapshot from Firebase to Model
  factory BlogModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return BlogModel(
      id: document.id,
      title: data['Title'] ?? '',
      author: data['Author'] ?? '',
      content: data['Content'] ?? '',
      image: data['Image'] ?? '',
    );
  }
}