import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/selectImgae_controller.dart';
import '../controller/profile_view_controller.dart';
import './widget/custom_text.dart';
import './widget/custom_buttom.dart';
import './widget/text_form_field.dart';

class EditProfileView extends StatefulWidget {
  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    String _loginMethod =
        FirebaseAuth.instance.currentUser!.providerData[0].providerId;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 130.h,
            child: Padding(
              padding: EdgeInsets.only(bottom: 24.h, left: 16.w, right: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  CustomText(
                    text: 'Edit Profile',
                    fontSize: 20,
                    alignment: Alignment.bottomCenter,
                  ),
                  Container(
                    width: 24,
                  ),
                ],
              ),
            ),
          ),
          GetBuilder<SelectImageViewModel>(
            init: SelectImageViewModel(),
            builder: (controller) => Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.only(right: 16.w, left: 16.w, bottom: 24.h),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.h),
                      child: _loginMethod == 'google.com' ||
                              _loginMethod == 'facebook.com'
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  _loginMethod == 'google.com'
                                      ? 'assets/images/icons/google.png'
                                      : 'assets/images/icons/facebook.png',
                                  fit: BoxFit.cover,
                                  height: 40.h,
                                  width: 40.h,
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                CustomText(
                                  text: _loginMethod == 'google.com'
                                      ? 'You\'re logged in using Google account!'
                                      : 'You\'re logged in using Facebook account!',
                                  fontSize: 16,
                                  alignment: Alignment.center,
                                ),
                              ],
                            )
                          : Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 60.h,
                                        backgroundImage:
                                            AssetImage('assets/profil.png'),
                                        foregroundImage: controller.imageFile !=
                                                null
                                            ? FileImage(controller.imageFile!)
                                            : null,
                                      ),
                                      SizedBox(
                                        width: 40.w,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.dialog(
                                            AlertDialog(
                                              title: CustomText(
                                                text: 'Choose option',
                                                fontSize: 20,
                                                color: Colors.blue,
                                              ),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Divider(
                                                    height: 1,
                                                  ),
                                                  ListTile(
                                                    onTap: () async {
                                                      try {
                                                        await controller
                                                            .cameraImage();
                                                        Get.back();
                                                      } catch (error) {
                                                        Get.back();
                                                      }
                                                    },
                                                    title: CustomText(
                                                      text: 'Camera',
                                                    ),
                                                    leading: Icon(
                                                      Icons.camera,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                  Divider(
                                                    height: 1,
                                                  ),
                                                  ListTile(
                                                    onTap: () async {
                                                      try {
                                                        await controller
                                                            .galleryImage();
                                                        Get.back();
                                                      } catch (error) {
                                                        Get.back();
                                                      }
                                                    },
                                                    title: CustomText(
                                                      text: 'Gallery',
                                                    ),
                                                    leading: Icon(
                                                      Icons.account_box,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                        child: Text('Select Image'),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 38.h,
                                  ),
                                  CustomTextFormField(
                                    title: 'Name',
                                    hintText: Get.find<ProfileViewController>()
                                        .currentUser!
                                        .name,
                                    initialValue:
                                        Get.find<ProfileViewController>()
                                            .currentUser!
                                            .name,
                                    validatorFn: (value) {
                                      if (value!.isEmpty || value.length < 4)
                                        return 'Please enter valid name.';
                                    },
                                    onSavedFn: (value) {
                                      Get.find<ProfileViewController>().name =
                                          value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 38.h,
                                  ),
                                  Column(
                                    children: [
                                      CustomTextFormField(
                                        title: 'Email',
                                        hintText:
                                            Get.find<ProfileViewController>()
                                                .currentUser!
                                                .email,
                                        initialValue:
                                            Get.find<ProfileViewController>()
                                                .currentUser!
                                                .email,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validatorFn: (value) {
                                          if (value!.isEmpty)
                                            return 'Please enter valid email address.';
                                        },
                                        onSavedFn: (value) {
                                          Get.find<ProfileViewController>()
                                              .email = value;
                                        },
                                      ),
                                      SizedBox(
                                        height: 38.h,
                                      ),
                                      CustomTextFormField(
                                        title: 'Password',
                                        hintText: '',
                                        obscureText: true,
                                        validatorFn: (value) {
                                          if (value!.isEmpty ||
                                              value.length < 6)
                                            return 'Please enter valid password with at least 6 characters.';
                                        },
                                        onSavedFn: (value) {
                                          Get.find<ProfileViewController>()
                                              .password = value;
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 50.h,
                                  ),
                                  _isLoading
                                      ? CircularProgressIndicator()
                                      : CustomButton(
                                          'SUBMIT',
                                          () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              setState(() {
                                                _isLoading = true;
                                              });
                                              try {
                                                await controller
                                                    .uploadImageToFirebase();
                                                Get.find<
                                                        ProfileViewController>()
                                                    .picUrl = controller.picUrl;
                                              } catch (e) {
                                                Get.find<
                                                        ProfileViewController>()
                                                    .picUrl = Get.find<
                                                        ProfileViewController>()
                                                    .currentUser!
                                                    .pic;
                                              }
                                              _formKey.currentState!.save();
                                              await Get.find<
                                                      ProfileViewController>()
                                                  .updateCurrentUser();
                                              setState(() {
                                                _isLoading = false;
                                              });
                                            }
                                          },
                                        ),
                                ],
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
