import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:diaryapps/models/diary_entry.dart';

class DiaryListWidget extends StatelessWidget {
  final List<DiaryEntry> diaryEntries;
  final Function(DiaryEntry) onEntryTapped;

  const DiaryListWidget({
    super.key,
    required this.diaryEntries,
    required this.onEntryTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: diaryEntries.length,
        itemBuilder: (BuildContext context, index) {
          final entry = diaryEntries[index];
          final entryDate = diaryEntries[index].date;
          String formattedDate = DateFormat('yyyy/MM/dd').format(entryDate);
          return ListTile(
            title: Text(entry.title),
            subtitle: Text(formattedDate), // ここでは日付を表示しますが、適宜調整してください
            onTap: () => onEntryTapped(entry), // エントリがタップされたときの処理
          );
        },
      ),
    );
  }
}
