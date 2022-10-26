import 'package:flutter/material.dart';

class TopTrips extends StatefulWidget {
  const TopTrips({super.key});

  @override
  State<TopTrips> createState() => _TopTripsState();
}

class _TopTripsState extends State<TopTrips> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Top Trips',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'Explore',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    width: 170,
                    margin: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        // image
                        SizedBox(
                          height: 130,
                          // width: 17,
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://images.pexels.com/photos/13415959/pexels-photo-13415959.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Text
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('De Louvre\nCamp Nou'),
                            Icon(
                              Icons.favorite_border,
                              size: 25,
                              color: Colors.red,
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
