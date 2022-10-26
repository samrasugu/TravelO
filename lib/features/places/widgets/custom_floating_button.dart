import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      child: SizedBox(
        width: 200.0,
        height: 200.0,
        child: RawMaterialButton(
          onPressed: () {},
          shape: const CircleBorder(),
          elevation: 20.0,
          child: const Icon(
            Icons.arrow_forward,
            size: 20,
          ),
        ),
      ),
    );
  }
}
