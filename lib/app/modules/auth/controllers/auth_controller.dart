import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'package:sample_project/controllers/api_controller.dart';
import 'package:sample_project/generated/graphql/api.graphql.dart';

class AuthController extends GetxController {
  final _auth = FirebaseAuth.instance;
  bool _isLoading;
  bool get isLoading => _isLoading;
  bool _isLoginMode;
  bool get isLoginMode => _isLoginMode;
  File _pickedImage;
  File get pickedImage => _pickedImage;

  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  final _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;
  final _userNameController = TextEditingController();
  TextEditingController get userNameController => _userNameController;
  final _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  void toggleAuthMode() {
    _isLoginMode = !_isLoginMode;
    update();
  }

  void pickImage() async {
    final pickedImage = await ImagePicker().getImage(
        source: ImageSource.camera,
        imageQuality: 50,
        maxHeight: 150,
        maxWidth: 150);
    final pickedImageFile = pickedImage != null ? File(pickedImage.path) : null;
    _pickedImage = pickedImageFile;
    update();
  }

  Future<String> _getAvatarUrl() async {
    if (_pickedImage != null) {
      final ref = FirebaseStorage.instance
          .ref()
          .child('user_images')
          .child(ApiController.to.userId + '.jpg');
      await ref.putFile(_pickedImage).whenComplete(() => log(
          'The user image file uploading completed',
          name: 'AuthController'));
      final imageUrl = await ref.getDownloadURL();
      return imageUrl;
    }
    return null;
  }

//   static String updateUserNameAndAvatar = '''
// mutation UpdateUserNameAndAvatar(\$id: uuid!, \$avatar_url: String, \$display_name: String) {
//   update_users_by_pk(_set: {avatar_url: \$avatar_url, display_name: \$display_name}, pk_columns: {id: \$id}) {
//     avatar_url
//     display_name
//     id
//     created_at
//   }
// }
//   ''';

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
        final avatarUrl = await _getAvatarUrl();
        ApiController.mutate(
          MutationOptions(
            document: UpdateUserNameAndAvatarMutation().document,
            variables: {
              'id': ApiController.to.userId,
              'display_name': _userNameController.text,
              'avatar_url': avatarUrl,
            },
          ),
        );
        _isLoading = false;
        _emailController.clear();
        _userNameController.clear();
        _passwordController.clear();
        _pickedImage = null;
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
