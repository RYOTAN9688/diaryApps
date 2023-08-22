import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore パッケージのインポート
import 'package:diaryapps/models/diary_entry.dart'; // データモデルのインポート

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<DiaryEntry>> getDiaryEntries() async {
    try {
      final snapshot = await _firestore.collection('diary_entries').get();
      final entries = snapshot.docs.map((doc) => DiaryEntry.fromFirestore(doc)).toList();
      return entries;
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching diary entries: $e');
      return [];
    }
  }

  Future<void> addDiaryEntry(DiaryEntry entry) async {
    try {
      await _firestore.collection('diary_entries').add({
        'title': entry.title,
        'date': entry.date,
        'content': entry.content,
      });
    } catch (e) {
      // ignore: avoid_print
      print('Error adding diary entry: $e');
    }
  }
  // 他の操作を追加
}
