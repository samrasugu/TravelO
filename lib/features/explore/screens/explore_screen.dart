import 'package:flutter/material.dart';
import 'package:travelo/common/widgets/loader.dart';
import 'package:travelo/features/explore/services/explore_services.dart';
import 'package:travelo/features/home/widgets/custom_search_bar.dart';
import 'package:travelo/features/places/screens/place_details_screen.dart';

class ExploreScreen extends StatefulWidget {
  static const String routeName = '/explore-screen';

  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List? places;

  final ExploreServices exploreServices = ExploreServices();

  @override
  void initState() {
    super.initState();
    fetchPlacesData();
  }

  fetchPlacesData() async {
    places = await exploreServices.fetchPlaces(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: Colors.deepOrange.shade300,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 42,
                    margin: const EdgeInsets.only(left: 15),
                    child: Material(
                      borderRadius: BorderRadius.circular(7),
                      elevation: 1,
                      child: TextFormField(
                        // onFieldSubmitted: ,
                        decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(
                                left: 6,
                              ),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 23,
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(
                            top: 10,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            borderSide: BorderSide(
                              color: Colors.black38,
                              width: 1,
                            ),
                          ),
                          hintText: 'Search for places...',
                          hintStyle: const TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: places == null
              ? const Loader()
              : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: (GridView.builder(
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
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const PlaceDetailsScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 180,
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        placesData['images'][0]!,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                      10,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            const SizedBox(
                                              height: 120,
                                            ),
                                            Text(
                                              '${placesData['name']},',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'KES ${placesData['price']}',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )),
                ),
        ),
      ),
    );
  }
}
