import 'package:flutter/material.dart';
import 'package:travelo/features/home/widgets/custom_icon.dart';
import 'package:travelo/features/places/widgets/custom_floating_button.dart';

class PlaceDetailsScreen extends StatefulWidget {
  static const String routeName = '/places-screen';
  const PlaceDetailsScreen({super.key});

  @override
  State<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen> {
  // custom book now button
  // final bookNowButton = Container(
  //   width: 200.0,
  //   height: 200.0,
  //   child: RawMaterialButton(
  //     onPressed: () {},
  //     shape: const CircleBorder(),
  //     elevation: 1.0,
  //     child: const Icon(
  //       Icons.arrow_forward,
  //       size: 20,
  //     ),
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 500,
                    child: Container(
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: NetworkImage(
                            'https://images.pexels.com/photos/13415959/pexels-photo-13415959.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
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
                              const SizedBox(
                                height: 350,
                              ),
                              Row(
                                children: const [
                                  Text(
                                    'Narok Reservoir',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                              Row(
                                children: const [
                                  Text(
                                    'KES 5000/person',
                                    style: TextStyle(
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
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      // CustomFloatingButton(),

                      DefaultTabController(
                        length: 2,
                        child: SizedBox(
                          height: 100,
                          child: Column(
                            children: const [
                              TabBar(
                                tabs: [
                                  Tab(
                                    icon: Icon(
                                      Icons.home,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Tab(
                                    icon: Icon(
                                      Icons.settings,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    Text('Hello'),
                                    Text('Hello'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Text(
                          'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet'),
                      // bookNowButton
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        // width: MediaQuery.of(context).size.width * 0.9,
        // height: MediaQuery.of(context).size.height * 0.1,
        width: 200,
        height: 60,
        child: FittedBox(
          child: FloatingActionButton.extended(
            onPressed: () {},
            // child: Row(
            //   children: [
            //     const Text(
            //       'Book Now',
            //     ),
            //     const Icon(
            //       Icons.arrow_forward,
            //     )
            //   ],
            // ),
            icon: Icon(Icons.arrow_forward),
            label: Text('Book Now'),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
