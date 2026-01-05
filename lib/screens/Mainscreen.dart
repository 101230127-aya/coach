import 'package:flutter_application_1/screens/attendance_screen.dart';
import 'package:flutter_application_1/screens/classes_screen.dart';
import 'package:flutter_application_1/screens/todo_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget{
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Map<String, Object>> _pages = [
    {
      'page': const AttendanceScreen(),
      'title': 'Attendance',
    },
    {
      'page': const ClassesScreen(),
      'title': 'Classes',
    },
    {
      'page': const TodoScreen(),
      'title': 'To-Do List',
    },
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Swim Coach App'),
            Text(
              _pages[_selectedIndex]['title'] as String,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Attendance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pool),
            label: 'Classes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: 'Tasks',
          ),
        ],
      ),
    );
  }
}
