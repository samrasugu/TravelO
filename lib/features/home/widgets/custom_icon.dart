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
          color: Colors.grey.shade300,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              blurRadius: 10.0,
              spreadRadius: 3.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 5.0,
                  spreadRadius: 3.0,
                ),
              ],
            ),
            padding: const EdgeInsets.all(3.0),
            child: Icon(
              icon,
              size: 25,
              color: Colors.deepOrange.shade300,
            ),
          ),
        ),
      ),
    );
  }
}
