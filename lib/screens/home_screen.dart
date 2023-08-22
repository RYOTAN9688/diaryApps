import 'package:flutter/material.dart';
import 'package:diaryapps/components/calendar_widget.dart';
import 'package:diaryapps/components/diary_list_widget.dart';
import 'package:diaryapps/screens/diary_detail_screen.dart';
import 'package:diaryapps/screens/diary_entry_screen.dart';
import 'package:diaryapps/services/firestore_service.dart';
import 'package:diaryapps/models/diary_entry.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<DiaryEntry> _diaryEntries = [];

  @override
  void initState() {
    super.initState();
    _loadDiaryEntries();
  }

  Future<void> _loadDiaryEntries() async {
    final firestoreService = FirestoreService();
    final entries = await firestoreService.getDiaryEntries();
    setState(() {
      _diaryEntries = entries;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('毎日日記'),
      ),
      body: Column(
        children: [
          const CalendarWidget(),
          DiaryListWidget(
              diaryEntries: _diaryEntries,
              onEntryTapped: (entry) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DiaryDetailScreen(
                              diaryEntry: entry,
                            )));
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DiaryEntryScreen()),
          );
        },
        child: const Icon(Icons.create),
      ),
      // ... 他の部分の実装
    );
  }
}
