import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_city/features/complaints/domain/entities/complaint_entity.dart';

class ComplaintCard extends StatelessWidget {
  final ComplaintEntity complaint;

  const ComplaintCard({super.key, required this.complaint});

  // ------------------------------
  //  STATUS HELPERS
  Color getStatusColor(int status) {
    switch (status) {
      case 0:
        return Colors.amber.shade200; // Pending
      case 1:
        return Colors.orange.shade200; // In Progress
      case 2:
        return Colors.green.shade200; // Resolved
      default:
        return Colors.grey.shade300;
    }
  }

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

  // ------------------------------
  //  DATE FORMATTER (same as Web)
  String formatDate(dynamic date) {
    try {
      if (date == null) return '';

      DateTime dt;

      if (date is String) {
        dt = DateTime.parse(date);
      } else if (date is DateTime) {
        dt = date;
      } else {
        return date.toString();
      }

      final day = DateFormat('E').format(dt);
      final month = DateFormat('MMM').format(dt);
      final dayNum = DateFormat('d').format(dt);
      final time = DateFormat('h:mm a').format(dt);

      return "$day, $month $dayNum – $time";
    } catch (e) {
      return date.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final int status = int.tryParse(complaint.status.toString()) ?? -1;

    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --------------------------------------
            //   TITLE + STATUS BADGE
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          complaint.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 8),

                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: getStatusColor(status),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    getStatusText(status),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // --------------------------------------
            //   DATE SUBMITTED
            Text(
              formatDate(complaint.dateSubmitted),
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            ),

            const Divider(height: 20),

            // --------------------------------------
            //   DESCRIPTION
            if (complaint.description.isNotEmpty)
              Text(
                complaint.description,
                style: const TextStyle(fontSize: 14),
              ),

            const SizedBox(height: 8),

            // --------------------------------------
            //   LOCATION
            if (complaint.location.isNotEmpty)
              Row(
                children: [
                  const Icon(Icons.location_on,
                      size: 14, color: Colors.blueGrey),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      complaint.location,
                      style: const TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                ],
              ),

            // --------------------------------------
            //   IMAGE (optional)
            if (complaint.imageUrl != null &&
                complaint.imageUrl!.isNotEmpty) ...[
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  complaint.imageUrl!,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 150,
                    color: Colors.grey.shade200,
                    alignment: Alignment.center,
                    child: const Icon(Icons.broken_image),
                  ),
                ),
              ),
            ],

            // --------------------------------------
            //  VIEW DETAILS BUTTON (clickable)
            const SizedBox(height: 12),

            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/complaint-details',
                  arguments: complaint,
                );
              },
              child: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(top: 8),
                child: const Text(
                  "View Details →",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}