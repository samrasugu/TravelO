import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travelo/common/widgets/loader.dart';
import 'package:travelo/features/home/widgets/custom_icon.dart';
import 'package:travelo/features/places/services/places_details_services.dart';

class PlaceDetailsScreen extends StatefulWidget {
  static const String routeName = '/places-screen';
  final String place;
  const PlaceDetailsScreen({super.key, required this.place});

  @override
  State<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 2, vsync: this);

  int initialIndex = 0;

  final PlaceDetailsServices placeDetailsServices = PlaceDetailsServices();

  @override
  void initState() {
    // _tabController = TabController(length: 2, vsync: this);
    super.initState();
    fetchPlaceDetails();
  }

  List? placeDetails;

  void fetchPlaceDetails() async {
    placeDetails = await placeDetailsServices.fetchPlaceDetails(
        context: context, place: widget.place);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  // ratings logic
  double avgRating = 0;
  double myRating = 0;

  @override
  Widget build(BuildContext context) {
    final placeData = placeDetails?[0];
    return Scaffold(
      body: SingleChildScrollView(
        child: placeData == null
            ? const Center(child: Loader())
            : Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(
                          // top: 10,
                          // left: 10,
                          // right: 10,
                          ),
                      child: SizedBox(
                        height: 500,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                placeData != null
                                    ? placeData['images'][0]
                                    : 'https://firebasestorage.googleapis.com/v0/b/travelo-platforms.appspot.com/o/places%2Folesereni.jpg?alt=media&token=33527563-bdaa-4753-8260-1835fd27d4f9',
                              ),
                              fit: BoxFit.cover,
                            ),
                            // borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomIcon(
                                          icon: Icons.arrow_back_ios_rounded,
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        CustomIcon(
                                          icon: Icons.favorite_border_rounded,
                                          onTap: () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 310,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${placeData['name']}',
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'KES ${placeData['price']}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      // width: 50,
                      child: TabBar(
                        controller: tabController,
                        labelColor: Colors.deepOrange,
                        labelStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        indicatorColor: Colors.transparent,
                        unselectedLabelColor: Colors.grey,
                        tabs: const [
                          Tab(
                            text: 'Overview',
                          ),
                          Tab(
                            text: 'Reviews',
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      // flex: 1,
                      height: MediaQuery.of(context).size.height * 1.5,
                      width: 350,
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey.shade100,
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Icon(
                                              Icons.lock_clock,
                                              size: 30,
                                              color: Colors.deepOrange,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'DURATION',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '5 hours',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    // Expanded(child: child)

                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey.shade100,
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Icon(
                                              Icons.star,
                                              size: 30,
                                              color: Colors.deepOrange,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'RATING',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '4.8 out of 5',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Text(
                                      placeData['description'],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                'Rate the place',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              RatingBar.builder(
                                initialRating: myRating,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.deepOrange.shade300,
                                  // size: 5,
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width * 0.70,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          // color: Colors.transparent,
        ),
        child: FloatingActionButton.extended(
          onPressed: () {},
          elevation: 1.0,
          backgroundColor: Colors.black,
          label: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                'Book Now',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
                size: 26,
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
