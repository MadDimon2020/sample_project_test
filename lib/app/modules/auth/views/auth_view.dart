import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:math';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/auth-view-image.jpg',
              fit: BoxFit.cover,
              color: Colors.black38,
              colorBlendMode: BlendMode.darken,
            ),
          ),
          AuthForm(),
        ],
      ),
    );
  }
}

class AuthForm extends GetWidget<AuthController> {
  double get deviceHeight => Get.height;
  double get deviceWidth => Get.width;

  void _trySubmit() {
    final isValid = controller.formKey.currentState.validate();
    Get.focusScope.unfocus();

    if (isValid) {
      controller.formKey.currentState.save();
      controller.submitAuthForm(
        email: controller.emailController.text.trim(),
        password: controller.passwordController.text.trim(),
        userName: controller.userNameController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) => Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(deviceWidth * 0.04),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(bottom: deviceHeight * 0.02),
                    padding: EdgeInsets.symmetric(
                        vertical: deviceHeight * 0.011,
                        horizontal: deviceWidth * 0.025),
                    transform: Matrix4.rotationZ(-4 * pi / 180)
                      ..translate(deviceWidth * (-0.01)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.pink,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          color: Colors.black26,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Text(
                      'Welcome To The Awesome Posts!',
                      style: TextStyle(
                        color:
                            Theme.of(context).accentTextTheme.headline6.color,
                        fontSize: deviceHeight * 0.036,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Align(
                  child: Text(
                    controller.isLoginMode
                        ? 'Please log in to your account'
                        : 'Please sign up to create an account',
                    style: TextStyle(
                      fontSize: deviceHeight * 0.0271,
                      color: Theme.of(context).accentTextTheme.headline5.color,
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.0271,
                ),
                if (!controller.isLoginMode)
                  InkWell(
                    onTap: controller.pickImage,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: deviceHeight * 0.05,
                          backgroundColor: Colors.white,
                          backgroundImage: controller.pickedImage != null
                              ? FileImage(controller.pickedImage)
                              : AssetImage('assets/images/anonymous_user.jpg'),
                        ),
                        TextButton.icon(
                          onPressed: controller.pickImage,
                          icon: Icon(
                            Entypo.camera,
                            color: Theme.of(context)
                                .accentTextTheme
                                .headline5
                                .color,
                            size: deviceHeight * 0.04,
                          ),
                          label: Text(
                            'Add Image',
                            style: TextStyle(
                                fontSize: deviceHeight * 0.0271,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: deviceHeight * 0.01,
                        ),
                      ],
                    ),
                  ),
                Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: deviceHeight * 0.01,
                          horizontal: deviceWidth * 0.025,
                        ),
                        decoration: BoxDecoration(color: Colors.black54),
                        child: TextFormField(
                          key: ValueKey('email'),
                          controller: controller.emailController,
                          validator: (value) {
                            if (value.isEmpty || !value.contains('@')) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            icon: const Icon(
                              Icons.email_outlined,
                              color: Colors.grey,
                            ),
                            hintText: 'Email address',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                              fontSize: deviceHeight * 0.0271,
                              color: Theme.of(context)
                                  .accentTextTheme
                                  .headline4
                                  .color),
                          onSaved: (value) {
                            controller.emailController.text = value;
                          },
                        ),
                      ),
                      SizedBox(
                        height: deviceHeight * 0.0271,
                      ),
                      if (!controller.isLoginMode)
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: deviceHeight * 0.01,
                            horizontal: deviceWidth * 0.025,
                          ),
                          decoration: BoxDecoration(color: Colors.black54),
                          child: TextFormField(
                            key: ValueKey('username'),
                            controller: controller.userNameController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your username';
                              }
                              return null;
                            },
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                                icon: Icon(Icons.person, color: Colors.grey),
                                hintText: 'Username',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                            style: TextStyle(
                                fontSize: deviceHeight * 0.0271,
                                color: Theme.of(context)
                                    .accentTextTheme
                                    .headline4
                                    .color),
                            onSaved: (value) {
                              controller.userNameController.text = value;
                            },
                          ),
                        ),
                      if (!controller.isLoginMode)
                        SizedBox(
                          height: deviceHeight * 0.0271,
                        ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: deviceHeight * 0.01,
                          horizontal: deviceWidth * 0.025,
                        ),
                        decoration: BoxDecoration(color: Colors.black54),
                        child: TextFormField(
                          key: ValueKey('password'),
                          controller: controller.passwordController,
                          validator: (value) {
                            if (value.isEmpty || value.length < 7) {
                              return 'Password must be at least 7 characters long.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock_outline,
                              color: Colors.grey,
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                              fontSize: deviceHeight * 0.0271,
                              color: Theme.of(context)
                                  .accentTextTheme
                                  .headline4
                                  .color),
                          obscureText: true,
                          onSaved: (value) {
                            controller.passwordController.text = value;
                          },
                        ),
                      ),
                      SizedBox(
                        height: deviceHeight * 0.016,
                      ),
                      if (controller.isLoading) CircularProgressIndicator(),
                      if (!controller.isLoading)
                        ElevatedButton(
                          // minWidth: double.maxFinite,
                          // color: Colors.pink,
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.pink),
                            minimumSize: MaterialStateProperty.all<Size>(
                              Size(double.maxFinite, double.minPositive),
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(deviceHeight * 0.01),
                            child: Text(
                              controller.isLoginMode ? 'Login' : 'Signup',
                              style: TextStyle(fontSize: deviceHeight * 0.0326),
                            ),
                          ),
                          onPressed: _trySubmit,
                        ),
                      SizedBox(
                        height: deviceHeight * 0.0271,
                      ),
                      if (!controller.isLoading)
                        TextButton(
                          child: Padding(
                            padding: EdgeInsets.all(deviceWidth * 0.02),
                            child: Text(
                              controller.isLoginMode
                                  ? 'Don\'t have an account? Sign up'
                                  : 'I already have an account',
                              style: TextStyle(
                                  fontSize: deviceHeight * 0.0271,
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline5
                                      .color),
                            ),
                          ),
                          onPressed: controller.toggleAuthMode,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
