import 'package:flutter/material.dart';
import 'package:travelo/features/search/screens/search_screen.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  void navigateToSearchScreen(String place) async {
    Navigator.pushNamed(context, SearchPlacesScreen.routeName,
        arguments: place);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10.0,
            spreadRadius: 10.0,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 1,
        child: TextFormField(
          onFieldSubmitted: navigateToSearchScreen,
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 5.0,
                        spreadRadius: 3.0,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.search,
                    color: Colors.deepOrange.shade300,
                  ),
                ),
              ),
            ),
            // filled: true,
            // fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(10),
            border: InputBorder.none,
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
