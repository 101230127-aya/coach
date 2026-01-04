import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
late List<int> attendance;

late int todayIndex ;
final int daysInMonth = 31;

String _monthName(int month) {
  const months = [
    'January', 'February', 'March', 'April',
    'May', 'June', 'July', 'August',
    'September', 'October', 'November', 'December'
  ];
  return months[month - 1];
}

@override
void initState() {
  super.initState();
  attendance=List.generate(daysInMonth, (index) => 0);
  todayIndex = DateTime.now().day - 1;
 
  for (int i = 0; i < todayIndex; i++) {
    attendance[i] = -1; 
  }
}

void _markAttendance(int index) {
  if (index == todayIndex && attendance[index] == 0) {
  setState(() {
    attendance[index] = 1;;
  });
}
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('Calender'),
     ),
    drawer: Drawer(
      child:  ListView(
    children: const [
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('Settings'),
      ),
      ListTile(
        leading: Icon(Icons.dark_mode),
        title: Text('Dark Mode'),
      ),
    ],
  ),
),
  body: Column(
  children: [
    const SizedBox(height: 10),
    Text(
  '${_monthName(DateTime.now().month)} ${DateTime.now().year}',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    const SizedBox(height: 10),
    Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
  child: GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 7,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
    ),
    itemCount: daysInMonth,
    itemBuilder: (context, index) {
      return InkWell(
    onTap: () => _markAttendance(index),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: attendance[index] == 1
          ? Colors.green
          : attendance[index] == -1
          ? Colors.red
          : Colors.grey.shade200,
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          '${index + 1}',
          style: const TextStyle(fontSize: 16),
        ),
      )
      );
    },
  ),
      ),
    ),
  ],
),
);
}
}