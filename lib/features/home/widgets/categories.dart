import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 60,
        child: ListView.builder(
          itemCount: 7,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.shade200,
                  //     blurRadius: 10.0,
                  //     spreadRadius: 10.0,
                  //   ),
                  // ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://images.pexels.com/photos/13415959/pexels-photo-13415959.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Camp',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
