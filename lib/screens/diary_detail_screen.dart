import 'package:flutter/material.dart';
import '../models/diary_entry.dart';

class DiaryDetailScreen extends StatelessWidget {
  final DiaryEntry diaryEntry;

  const DiaryDetailScreen({super.key, required this.diaryEntry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diary Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              diaryEntry.title,
              style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              diaryEntry.date.toString(), // 日付表示
              style: const TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
            const SizedBox(height: 16.0),
            Text(
              diaryEntry.content,
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
