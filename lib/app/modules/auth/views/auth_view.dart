import 'package:flutter/material.dart';

import 'package:sample_project/app/modules/auth/auth_widgets/auth_form.dart';

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
