import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final String? value;
  final Function(String?) onChanged;

  const CustomDropdown({
    super.key,
    required this.hintText,
    required this.items,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 2),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(hintText),
          icon: const Icon(Icons.arrow_drop_down),
          isExpanded: true,
          onChanged: onChanged,
          items:
              items.map((type) {
                return DropdownMenuItem(value: type, child: Text(type));
              }).toList(),
        ),
      ),
    );
  }
}
