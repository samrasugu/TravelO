import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelo/common/widgets/custom_button.dart';
import 'package:travelo/common/widgets/custom_text_field.dart';
import 'package:travelo/features/account/services/account_services.dart';
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

  final AccountServices accountServices = AccountServices();

  String? image;

  void uploadImage() async {
    await accountServices.uploadImage(context);
    setState(() {});
  }

  // update profile
  void updateProfile() async {
    await accountServices.updateDetails(
        context: context,
        email: emailController.text.trim(),
        displayName:
            "${firstNameController.text.trim()}${lastNameController.text.trim()}");
    setState(() {});
  }

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        uploadImage();
                      },
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                          user.photoURL!,
                        ),
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
                          controller: emailController),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      child: CustomButton(
                        text: 'Update',
                        onTap: () {
                          updateProfile();
                        },
                        color: Colors.deepOrange,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    user.emailVerified
                        ? const SizedBox(
                            height: 10,
                          )
                        : const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 25.0,
                            ),
                            child: ListTile(
                              tileColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7))),
                              leading: Icon(
                                Icons.assignment_late_rounded,
                                color: Colors.white,
                              ),
                              title: Text(
                                'Email not verified!\nCheck your inbox',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
