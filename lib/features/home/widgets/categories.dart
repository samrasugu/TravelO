import 'package:flutter/material.dart';
import 'package:travelo/common/widgets/loader.dart';
import 'package:travelo/features/categories/screens/categories_screen.dart';
import 'package:travelo/features/home/services/home_services.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final HomeServices homeServices = HomeServices();
  List? categories;

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  void fetchCategories() async {
    categories = await homeServices.fetchCategories(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return categories == null
        ? const Loader()
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 60,
              child: ListView.builder(
                itemCount: categories!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final categoryData = categories![index];
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
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, CategoriesScreen.routeName,
                              arguments: 
                                categoryData['name']
                              );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                categoryData['image'],
                                fit: BoxFit.cover,
                                height: 40,
                                width: 40,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              categoryData['name'],
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
  }
}
