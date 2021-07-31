import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_project/app/modules/auth/views/auth_view.dart';
import 'package:sample_project/app/modules/home/views/home_view.dart';
import 'package:sample_project/controllers/api_controller.dart';

class Root extends GetWidget<ApiController> {
  @override
  Widget build(BuildContext context) {
    log('The token expires in ${ApiController.to.token.value?.expiresIn}',
        name: 'Root');
    return Obx(() {
      return ApiController.to.token.value == null ||
              ApiController.to.token.value?.expiresIn <= 0
          ? AuthView()
          : HomeView();
    });
  }
}
