import 'package:flutter/material.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/widgets/custom_button.dart';
import 'package:smart_city/features/complaints/presentation/views/widgets/custom_dropdown.dart';
import 'package:smart_city/features/complaints/presentation/views/widgets/custom_textfield.dart';

class ComplaintsViewBody extends StatefulWidget {
  const ComplaintsViewBody({super.key});

  @override
  State<ComplaintsViewBody> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintsViewBody> {
  String? _selectedType;
  final TextEditingController _detailsController = TextEditingController();

  final List<String> _types = ['Complaint', 'Suggestion'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Type',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            CustomDropdown(
              hintText: 'Select type',
              items: _types,
              value: _selectedType,
              onChanged: (value) {
                setState(() => _selectedType = value);
              },
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _detailsController,
              hintText: 'Write your complaint or suggestion here...',
              maxLines: 6,
              obscureText: false,
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: 'Send',
              color: AppColors.primaryColor,
              textColor: Colors.black,
              onPressed: () {},
            ),
            SizedBox(height: 42),
          ],
        ),
      ),
    );
  }
}
