import 'package:flutter/material.dart';

class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Assignments', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: _buildStatusCard('Pending', '3', Colors.orange)),
              const SizedBox(width: 10),
              Expanded(child: _buildStatusCard('Submitted', '7', Colors.green)),
              const SizedBox(width: 10),
              Expanded(child: _buildStatusCard('Overdue', '1', Colors.red)),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Assignment List', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                _buildAssignmentCard(
                  'Database Design Project',
                  'Database Systems',
                  'Due: Dec 15, 2024',
                  'pending',
                  'Design a complete database schema for a library management system.',
                ),
                _buildAssignmentCard(
                  'Algorithm Analysis',
                  'Data Structures',
                  'Due: Dec 20, 2024',
                  'pending',
                  'Analyze time complexity of sorting algorithms.',
                ),
                _buildAssignmentCard(
                  'Network Protocol Implementation',
                  'Computer Networks',
                  'Due: Dec 10, 2024',
                  'overdue',
                  'Implement TCP/IP protocol simulation.',
                ),
                _buildAssignmentCard(
                  'Software Requirements Document',
                  'Software Engineering',
                  'Submitted: Dec 5, 2024',
                  'submitted',
                  'Create SRS for online shopping system.',
                ),
                _buildAssignmentCard(
                  'Process Scheduling Simulation',
                  'Operating Systems',
                  'Submitted: Nov 28, 2024',
                  'submitted',
                  'Simulate different CPU scheduling algorithms.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusCard(String title, String count, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(count, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
            Text(title, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildAssignmentCard(String title, String subject, String date, String status, String description) {
    Color statusColor;
    IconData statusIcon;
    
    switch (status) {
      case 'pending':
        statusColor = Colors.orange;
        statusIcon = Icons.pending;
        break;
      case 'submitted':
        statusColor = Colors.green;
        statusIcon = Icons.check_circle;
        break;
      case 'overdue':
        statusColor = Colors.red;
        statusIcon = Icons.error;
        break;
      default:
        statusColor = Colors.grey;
        statusIcon = Icons.help;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                Icon(statusIcon, color: statusColor, size: 20),
              ],
            ),
            const SizedBox(height: 8),
            Text(subject, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w500)),
            const SizedBox(height: 4),
            Text(date, style: TextStyle(color: statusColor, fontSize: 12)),
            const SizedBox(height: 8),
            Text(description, style: const TextStyle(fontSize: 14, color: Colors.grey)),
            if (status == 'pending') ...[
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('View Details'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}