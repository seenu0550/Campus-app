import 'package:flutter/material.dart';

class StudentProfile extends StatelessWidget {
  const StudentProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
          const SizedBox(height: 20),
          const Text('John Doe', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const Text('Computer Science Engineering', style: TextStyle(fontSize: 16, color: Colors.grey)),
          const SizedBox(height: 30),
          Expanded(
            child: ListView(
              children: [
                _buildProfileItem('Student ID', 'CS2021001'),
                _buildProfileItem('Email', 'john.doe@student.edu'),
                _buildProfileItem('Phone', '+1 234 567 8901'),
                _buildProfileItem('Year', '3rd Year'),
                _buildProfileItem('Semester', '6th Semester'),
                _buildProfileItem('CGPA', '8.5'),
                _buildProfileItem('Address', '123 Student Housing, Campus'),
                _buildProfileItem('Parent Contact', '+1 234 567 8902'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem(String label, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            SizedBox(width: 120, child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold))),
            Expanded(child: Text(value)),
          ],
        ),
      ),
    );
  }
}