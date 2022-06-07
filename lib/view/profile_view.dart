import 'package:apoticare/controller/auth_view_controller.dart';
import 'package:apoticare/view/edit_profile_view.dart';
import 'package:apoticare/view/welcomeview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../controller/profile_view_controller.dart';
import './widget/custom_text.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewController>(
      init: ProfileViewController(),
      builder: (contorller) => Scaffold(
          body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        image: DecorationImage(
                            image:
                                NetworkImage('${contorller.currentUser!.pic}'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Column(
                      children: [
                        CustomText(
                          text: contorller.currentUser!.name,
                        ),
                        CustomText(
                          text: contorller.currentUser!.email,
                        ),
                        FlatButton(
                            onPressed: () {
                              contorller.signOut();
                              Get.to(() => WelcomeView());
                            },
                            child: Text("logout")),
                        FlatButton(
                            onPressed: () {
                              Get.to(() => EditProfileView());
                            },
                            child: Text("Edit")),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
