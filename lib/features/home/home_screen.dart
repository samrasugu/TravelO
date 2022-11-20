import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelo/features/home/widgets/categories.dart';
import 'package:travelo/features/home/widgets/custom_icon.dart';
import 'package:travelo/features/home/widgets/custom_search_bar.dart';
import 'package:travelo/features/home/widgets/top_trips.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 17,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/13600148/pexels-photo-13600148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          ),
                          radius: 17,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Hi, ${user?.displayName}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                        ),
                      )
                    ],
                  ),
                  // like button
                  CustomIcon(
                    icon: Icons.notifications_none_rounded,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Where do\nyou want to go?',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomSearchBar(),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Categories(),
            const SizedBox(
              height: 20,
            ),
            const TopTrips()
          ],
        ),
      ),
    );
  }
}
