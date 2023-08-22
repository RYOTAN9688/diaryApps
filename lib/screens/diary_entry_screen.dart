import 'package:flutter/material.dart';
import 'package:diaryapps/models/diary_entry.dart';
import 'package:diaryapps/services/firestore_service.dart';

class DiaryEntryScreen extends StatefulWidget {
  const DiaryEntryScreen({super.key});

  @override
  DiaryEntryScreenState createState() => DiaryEntryScreenState();
}

class DiaryEntryScreenState extends State<DiaryEntryScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  final FirestoreService _firestoreService = FirestoreService();

  void _saveDiaryEntry() async {
    final title = _titleController.text;
    final content = _contentController.text;
    final date = DateTime.now();

    final newEntry = DiaryEntry(title: title, content: content, date: date);
    await _firestoreService.addDiaryEntry(newEntry);

    // Show a modal to indicate successful entry saving
    _showSaveConfirmationModal();
  }

  void _showSaveConfirmationModal() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('保存完了'),
          content: const Text('日記が保存されました。'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the previous screen
              },
              child: const Text('閉じる'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('日記を追加'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'タイトル'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _contentController,
              maxLines: 5,
              decoration: const InputDecoration(labelText: '内容'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveDiaryEntry,
              child: const Text('保存'),
            ),
          ],
        ),
      ),
    );
  }
}
