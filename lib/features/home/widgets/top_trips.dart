import 'package:flutter/material.dart';
import 'package:travelo/common/widgets/loader.dart';
import 'package:travelo/features/home/services/home_services.dart';
import 'package:travelo/features/places/screens/place_details_screen.dart';

class TopTrips extends StatefulWidget {
  const TopTrips({super.key});

  @override
  State<TopTrips> createState() => _TopTripsState();
}

class _TopTripsState extends State<TopTrips> {
  List? places;

  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchPlaces();
  }

  fetchPlaces() async {
    places = await homeServices.fetchPlaces(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: const [
                    Text(
                      'Top Trips',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.deepOrange,
                      size: 16,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  children: [
                    Text(
                      'Explore',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.deepOrange,
                      size: 15,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          places == null
              ? const Loader()
              : SizedBox(
                  height: 220,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: places!.length,
                      itemBuilder: (context, index) {
                        final placesData = places![index];
                        final place = places![index]['name'];
                        return Container(
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, PlaceDetailsScreen.routeName,
                                  arguments: placesData['name']);
                            },
                            child: Column(
                              children: [
                                // image
                                SizedBox(
                                  height: 140,
                                  child: Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      child: Image.network(
                                        placesData['images'][0],
                                        width: 160,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
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
                      }),
                )
        ],
      ),
    );
  }
}
