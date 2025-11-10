import 'package:flutter/material.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Attendance Overview', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildAttendanceCard('Overall', '85%', Colors.green),
                  _buildAttendanceCard('This Month', '90%', Colors.blue),
                  _buildAttendanceCard('Required', '75%', Colors.orange),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text('Subject-wise Attendance', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                _buildSubjectCard('Data Structures', 88, 25, 22),
                _buildSubjectCard('Database Systems', 92, 24, 22),
                _buildSubjectCard('Computer Networks', 78, 23, 18),
                _buildSubjectCard('Software Engineering', 85, 26, 22),
                _buildSubjectCard('Operating Systems', 90, 25, 23),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttendanceCard(String title, String percentage, Color color) {
    return Column(
      children: [
        Text(percentage, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildSubjectCard(String subject, int percentage, int total, int present) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subject, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$present/$total classes'),
                Text('$percentage%', style: TextStyle(
                  color: percentage >= 75 ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                )),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: percentage / 100,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                percentage >= 75 ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}