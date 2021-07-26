import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample_project/controllers/api_controller.dart';

class AuthController extends GetxController {
  final _auth = FirebaseAuth.instance;
  bool _isLoading;
  bool get isLoading => _isLoading;
  bool _isLoginMode;
  bool get isLoginMode => _isLoginMode;

  void toggleAuthMode() {
    _isLoginMode = !_isLoginMode;
    update();
  }

  void submitAuthForm({String userName, String email, String password}) async {
    try {
      _isLoading = true;
      update();
      if (isLoginMode) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        await ApiController.to.login(email, password);
        _isLoading = false;
      } else {
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await ApiController.to.register(email, password);
        await ApiController.to.login(email, password);
        _isLoading = false;
      }
    } on PlatformException catch (e) {
      var message = 'An error occured, please check your credentials';

      if (e.message != null) {
        message = e.message;
      }
      Get.snackbar(
        'An error occured!',
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.grey[300],
      );
      _isLoading = false;
      update();
    } catch (e) {
      Get.snackbar(
        'An error occured!',
        e.message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.grey[300],
      );
      _isLoading = false;
      update();
    }
  }

  @override
  void onInit() {
    _isLoading = false;
    _isLoginMode = true;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
