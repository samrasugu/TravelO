import 'package:flutter/material.dart';
import 'package:travelo/common/widgets/loader.dart';
import 'package:travelo/features/categories/services/categories_services.dart';
import 'package:travelo/features/places/screens/place_details_screen.dart';

class CategoriesScreen extends StatefulWidget {
  static const String routeName = '/categories-screen';
  final String category;
  const CategoriesScreen({super.key, required this.category});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final CategoryServices categoryServices = CategoryServices();
  List? places;

  @override
  void initState() {
    super.initState();
    fetchPlaces();
  }

  void fetchPlaces() async {
    places = await categoryServices.fetchPlaces(
        context: context, category: widget.category);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(widget.category),
        elevation: 0,
        // centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: (places == null
                ? const Loader()
                : GridView.builder(
                    itemCount: places!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final placesData = places![index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, PlaceDetailsScreen.routeName,
                              arguments: placesData['name']);
                        },
                        child: Container(
                          width: 170,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey.shade300,
                              )
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.grey.shade200,
                              //     blurRadius: 5.0,
                              //     spreadRadius: 10.0,
                              //   ),
                              // ],
                              ),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              // image
                              SizedBox(
                                height: 120,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    child: Image.network(
                                      placesData['images'][0],
                                      width: 180,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // Text
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        '${placesData['name']}\n${placesData['county']}'),
                                    Container(
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
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.favorite_border,
                                          size: 25,
                                          color: Colors.deepOrange.shade300,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )),
          )
        ],
      ),
    );
  }
}
