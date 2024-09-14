import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationsModel {
  String? id;
  Timestamp? time;
  final String title;
  String? type;
  String? path;
  final String image;
  bool? isRead;
  bool? isVisited;

  NotificationsModel({
    this.id,
    required this.image,
    required this.title,
    this.time,
    this.type,
    this.path,
    this.isRead,
    this.isVisited,
  });

  /// Create Empty func for clean code
  static NotificationsModel empty() => NotificationsModel(image: '', title: '');

  /// Json Format
  Map<String, dynamic> toJson() {
    return {
      'Time': time,
      'Title': title,
      'Type': type,
      'Path': path,
      'Image': image,
      'IsRead': isRead,
      'IsVisited': isVisited,
    };
  }

  factory NotificationsModel.fromMap(Map<String, dynamic> data, String? id) {
    return NotificationsModel(
      id: id,
      time: data['Time'] as Timestamp,
      title: data['Title'] as String,
      type: data['Type'] as String,
      path: data['Path'] as String,
      image: data['Image'] as String,
      isRead: data['IsRead'] as bool,
      isVisited: data['IsVisited'] as bool,
    );
  }

  // Factory constructor to create an AddressModel from a DocumentSnapshot
  factory NotificationsModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return NotificationsModel(
      id: snapshot.id,
      time: data['Time'] != null && data['Time'] is Timestamp
          ? data['Time'] as Timestamp
          : Timestamp.now(),
      title: data['Title'] ?? '',
      type: data['Type'] ?? '',
      path: data['Path'] ?? '',
      image: data['Image'] ?? '',
      isRead: data['IsRead'] ?? false,
      isVisited: data['IsVisited'] ?? false,
    );
  }
}