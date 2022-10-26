import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData leadingicon;
  final IconData trailingicon;
  final String title;
  final VoidCallback onTap;
  const CustomListTile({
    super.key,
    required this.leadingicon,
    required this.trailingicon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        leadingicon,
        color: Colors.red,
      ),
      title: Text(
        title,
        textScaleFactor: 1.5,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(
        trailingicon,
        color: Colors.red,
      ),
      onTap: onTap,
    );
  }
}
