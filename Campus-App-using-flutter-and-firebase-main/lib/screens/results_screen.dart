import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Academic Results', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildGPACard('Current CGPA', '8.5', Colors.blue),
                  _buildGPACard('Semester GPA', '8.8', Colors.green),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text('Semester Results', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                _buildSemesterCard('Semester 6 (Current)', [
                  {'subject': 'Data Structures', 'grade': 'A', 'credits': 4},
                  {'subject': 'Database Systems', 'grade': 'A+', 'credits': 4},
                  {'subject': 'Computer Networks', 'grade': 'B+', 'credits': 3},
                  {'subject': 'Software Engineering', 'grade': 'A', 'credits': 3},
                ], 8.8),
                _buildSemesterCard('Semester 5', [
                  {'subject': 'Operating Systems', 'grade': 'A+', 'credits': 4},
                  {'subject': 'Compiler Design', 'grade': 'A', 'credits': 4},
                  {'subject': 'Computer Graphics', 'grade': 'B+', 'credits': 3},
                  {'subject': 'Web Technologies', 'grade': 'A', 'credits': 3},
                ], 8.7),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGPACard(String title, String gpa, Color color) {
    return Column(
      children: [
        Text(gpa, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: color)),
        Text(title, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildSemesterCard(String semester, List<Map<String, dynamic>> subjects, double gpa) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(semester, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('GPA: $gpa', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue)),
              ],
            ),
            const SizedBox(height: 12),
            ...subjects.map((subject) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Expanded(child: Text(subject['subject'])),
                  SizedBox(
                    width: 60,
                    child: Text('Credits: ${subject['credits']}', style: const TextStyle(fontSize: 12)),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getGradeColor(subject['grade']),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(subject['grade'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }

  Color _getGradeColor(String grade) {
    switch (grade) {
      case 'A+': return Colors.green;
      case 'A': return Colors.blue;
      case 'B+': return Colors.orange;
      case 'B': return Colors.yellow[700]!;
      default: return Colors.red;
    }
  }
}