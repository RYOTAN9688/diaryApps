import 'package:cloud_firestore/cloud_firestore.dart';

class DiaryEntry {
  final DateTime date;
  final String title;
  final String content;
  final String imageUrl;

  DiaryEntry({
    required this.date,
    required this.title,
    required this.content,
    this.imageUrl = '',
  });

  factory DiaryEntry.fromFirestore(QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return DiaryEntry(
      title: data['title'],
      date: data['date'].toDate(),
      content: data['content'],
    );
  }
}
