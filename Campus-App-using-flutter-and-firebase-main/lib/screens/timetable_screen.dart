import 'package:flutter/material.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Weekly Timetable', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                _buildDaySchedule('Monday', [
                  {'time': '9:00 - 10:00', 'subject': 'Data Structures', 'room': 'CS-101'},
                  {'time': '10:00 - 11:00', 'subject': 'Database Systems', 'room': 'CS-102'},
                  {'time': '11:30 - 12:30', 'subject': 'Computer Networks', 'room': 'CS-103'},
                ]),
                _buildDaySchedule('Tuesday', [
                  {'time': '9:00 - 10:00', 'subject': 'Software Engineering', 'room': 'CS-104'},
                  {'time': '10:00 - 11:00', 'subject': 'Operating Systems', 'room': 'CS-105'},
                  {'time': '2:00 - 4:00', 'subject': 'Database Lab', 'room': 'Lab-1'},
                ]),
                _buildDaySchedule('Wednesday', [
                  {'time': '9:00 - 10:00', 'subject': 'Data Structures', 'room': 'CS-101'},
                  {'time': '11:30 - 12:30', 'subject': 'Computer Networks', 'room': 'CS-103'},
                  {'time': '2:00 - 4:00', 'subject': 'Programming Lab', 'room': 'Lab-2'},
                ]),
                _buildDaySchedule('Thursday', [
                  {'time': '10:00 - 11:00', 'subject': 'Database Systems', 'room': 'CS-102'},
                  {'time': '11:30 - 12:30', 'subject': 'Software Engineering', 'room': 'CS-104'},
                  {'time': '1:30 - 2:30', 'subject': 'Operating Systems', 'room': 'CS-105'},
                ]),
                _buildDaySchedule('Friday', [
                  {'time': '9:00 - 10:00', 'subject': 'Data Structures', 'room': 'CS-101'},
                  {'time': '10:00 - 11:00', 'subject': 'Computer Networks', 'room': 'CS-103'},
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDaySchedule(String day, List<Map<String, String>> classes) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(day, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
            const SizedBox(height: 12),
            ...classes.map((classInfo) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(classInfo['time']!, style: const TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(classInfo['subject']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text(classInfo['room']!, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }
}