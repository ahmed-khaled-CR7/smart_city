import 'package:flutter/material.dart';

class DeleteBackground extends StatelessWidget {
  final bool isLeft;

  const DeleteBackground({super.key, required this.isLeft});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
      padding: EdgeInsets.only(left: isLeft ? 20 : 0, right: isLeft ? 0 : 20),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Icon(Icons.delete, color: Colors.white),
    );
  }
}
