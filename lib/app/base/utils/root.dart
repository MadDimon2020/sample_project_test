import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_project/app/modules/auth/views/auth_view.dart';
import 'package:sample_project/app/modules/home/views/home_view.dart';
import 'package:sample_project/controllers/api_controller.dart';

class Root extends GetWidget<ApiController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ApiController.to.token.value == null ? AuthView() : HomeView();
    });
  }
}
