import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_city/features/complaints/domain/entities/complaint_entity.dart';

class ComplaintDetailsView extends StatelessWidget {
  // ← لازم الثابت ده علشان onGenerateRoute يستخدمه
  static const String routeName = '/complaint-details';

  const ComplaintDetailsView({super.key});

  // Format date same as web
  String formatDate(DateTime date) {
    final day = DateFormat('E').format(date);
    final month = DateFormat('MMM').format(date);
    final dayNum = DateFormat('d').format(date);
    final time = DateFormat('h:mm a').format(date);

    return "$day, $month $dayNum – $time";
  }

  // Status colors
  Color getStatusColor(int status) {
    switch (status) {
      case 0:
        return Colors.amber.shade200;
      case 1:
        return Colors.orange.shade200;
      case 2:
        return Colors.green.shade200;
      default:
        return Colors.grey.shade300;
    }
  }

  // Status text
  String getStatusText(int status) {
    switch (status) {
      case 0:
        return "Pending";
      case 1:
        return "In Progress";
      case 2:
        return "Resolved";
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    final complaint = ModalRoute.of(context)!.settings.arguments as ComplaintEntity;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Complaint Details"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title + Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    complaint.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: getStatusColor(complaint.status),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    getStatusText(complaint.status),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Date
            Text(
              formatDate(complaint.dateSubmitted),
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
            ),

            const SizedBox(height: 20),

            // Image
            if (complaint.imageUrl != null && complaint.imageUrl!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  complaint.imageUrl!,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

            if (complaint.imageUrl != null && complaint.imageUrl!.isNotEmpty)
              const SizedBox(height: 20),

            // Description Title
            const Text(
              "Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              complaint.description,
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            // Location
            const Text(
              "Location",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.red, size: 20),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    complaint.location,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Citizen ID — optional
            Text(
              "Citizen ID: ${complaint.citizenId}",
              style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
