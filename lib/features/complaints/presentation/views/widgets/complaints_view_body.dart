import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_city/core/utils/app_colors.dart';
import 'package:smart_city/core/widgets/custom_button.dart';
import 'package:smart_city/features/complaints/presentation/views/widgets/custom_dropdown.dart';
import 'package:smart_city/features/complaints/presentation/views/widgets/custom_textfield.dart';
import 'package:smart_city/features/complaints/data/dtos/complaint_create_dto.dart';
import 'package:smart_city/features/complaints/presentation/cubit/complaints_cubit.dart';
import 'package:smart_city/features/complaints/presentation/cubit/complaints_state.dart';

import 'package:smart_city/core/helper/image_picker_helper.dart';
import 'package:smart_city/core/services/image_upload_service.dart';

class ComplaintsViewBody extends StatefulWidget {
  final int citizenId = 1;

  const ComplaintsViewBody({super.key});

  @override
  State<ComplaintsViewBody> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintsViewBody> {
  String? _selectedType;
  XFile? _selectedImage;
  String? _uploadedImageUrl;

  final TextEditingController _detailsController = TextEditingController();

  final List<String> _types = ['Complaint', 'Suggestion'];
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ComplaintsCubit, ComplaintsState>(
      listener: (context, state) {
        if (state is ComplaintCreatedSuccess) {
          setState(() => _isLoading = false);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Sent successfully!'),
              backgroundColor: Colors.green,
            ),
          );

          // Reset fields
          _detailsController.clear();
          _selectedType = null;
          _selectedImage = null;
          _uploadedImageUrl = null;
          setState(() {});
        } 
        else if (state is ComplaintCreationFailed) {
          setState(() => _isLoading = false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },

      child: Padding(
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

              const SizedBox(height: 20),

              const Text(
                "Attach Image (optional)",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),

              GestureDetector(
                onTap: () async {
                  _selectedImage = await ImagePickerHelper.pickImage();
                  setState(() {});
                },
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: _selectedImage == null
                      ? const Center(child: Text("Tap to select image"))
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            // ignore: unnecessary_null_comparison
                            File(_selectedImage!.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 32),

              // ------------------------ SEND BUTTON ------------------------
              CustomButton(
                text: _isLoading ? 'Sending...' : 'Send',
                color: AppColors.primaryColor,
                textColor: Colors.black,
                onPressed: () async {
                  if (_isLoading || _selectedType == null || _detailsController.text.isEmpty) {
                    return;
                  }

                  setState(() => _isLoading = true);

                  // Upload image if exists
                  if (_selectedImage != null) {
                    _uploadedImageUrl = await ImageUploadService.uploadImage(_selectedImage!.path);
                  }

                  _sendComplaint(context);
                },
              ),

              const SizedBox(height: 42),
            ],
          ),
        ),
      ),
    );
  }

  void _sendComplaint(BuildContext context) {
    final complaintData = ComplaintCreateDto(
      title: _selectedType!,
      description: _detailsController.text.trim(),
      location: "Submitted via App",
      imageUrl: _uploadedImageUrl,  // ← important!
    );

    context.read<ComplaintsCubit>().createComplaint(
          citizenId: widget.citizenId,
          complaintData: complaintData,
        );
  }
}