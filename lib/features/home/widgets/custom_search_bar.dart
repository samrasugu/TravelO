import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        elevation: 1,
        child: TextFormField(
          // onFieldSubmitted: (){},
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.search,
                  color: Colors.red,
                ),
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.only(
              top: 10,
              left: 20,
              // bottom: 20,
            ),
            border: const OutlineInputBorder(
              // gapPadding: 100,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              borderSide: BorderSide(
                color: Colors.white,
                width: 0,
              ),
            ),
            hintText: 'Search for places...',
            hintStyle: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
