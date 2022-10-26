import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const CustomIcon({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.red,
        ),
        child: Container(
          // width: 20,
          // height: 20,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: 2.0, color: Colors.red)),
          padding: const EdgeInsets.all(5.0),
          child: Icon(
            icon,
            size: 30,
          ),
        ),
      ),
    );
  }
}
