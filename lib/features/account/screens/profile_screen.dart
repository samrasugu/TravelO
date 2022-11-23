import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelo/common/widgets/custom_button.dart';
import 'package:travelo/common/widgets/custom_text_field.dart';
import 'package:travelo/features/auth/services/auth_services.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile-page';
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthServices>().user;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Update Profile',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.deepOrange,
          ),
        ),
        body: Column(
          children: [
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/13600148/pexels-photo-13600148.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      color: Colors.black12,
                      height: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // form fields
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 20),
                    child: CustomTextField(
                        hintText: '${user.displayName}',
                        controller: firstNameController),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                    ),
                    child: CustomTextField(
                        hintText: '${user.email}',
                        controller: firstNameController),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    child: CustomButton(
                      text: 'Update',
                      onTap: () {},
                      color: Colors.deepOrange,
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
