import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sample_project/app/routes/app_pages.dart';
import 'package:sample_project/controllers/api_controller.dart';
import 'package:sample_project/generated/graphql/api.graphql.dart';

class NewPostController extends GetxController {
  static NewPostController get to => Get.find<NewPostController>();

  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  final _titleController = TextEditingController();
  TextEditingController get titleController => _titleController;
  final _postContentController = TextEditingController();
  TextEditingController get postContentController => _postContentController;

//   static String addNewPost = '''
// mutation addNewPost(\$content: String, \$title: String) {
//   insert_news_one(object: {content: \$content, title: \$title}) {
//     title
//     content
//   }
// }
// ''';

  Future<void> publishPost() async {
    final formIsValid = _formKey.currentState.validate();
    if (formIsValid) {
      Get.focusScope.unfocus();
      final mutationResult = await ApiController.mutate(
        MutationOptions(
          // document: gql(NewPostController.addNewPost),
          document: AddNewPostMutation().document,
          variables: {
            'title': _titleController.text,
            'content': _postContentController.text,
          },
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );
      if (mutationResult.isLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (mutationResult.hasException) {
        log('${mutationResult.exception.toString()}',
            name: 'NewPostController');
        Get.defaultDialog(
          title: 'An error occured!',
          titleStyle: TextStyle(color: Colors.red),
          middleText:
              'Could not post your news, as the server does not respond.',
          middleTextStyle: TextStyle(fontWeight: FontWeight.bold),
          actions: [
            ElevatedButton.icon(
              onPressed: () {
                Get.offAllNamed(Routes.HOME);
              },
              icon: Icon(Icons.home),
              label: Text('Homepage'),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Try to post again'),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
          ],
        );
      } else if (mutationResult.data['insert_news_one']['title'] ==
              _titleController.text &&
          mutationResult.data['insert_news_one']['content'] ==
              _postContentController.text) {
        Get.defaultDialog(
          backgroundColor: Colors.greenAccent,
          title: 'Congratulations!',
          titleStyle: TextStyle(color: Colors.black),
          middleText:
              'Your post "${_titleController.text.length < 50 ? _titleController.text : (_titleController.text.substring(0, 100) + "...")}" has been published.',
          middleTextStyle: TextStyle(fontWeight: FontWeight.bold),
          actions: [
            ElevatedButton.icon(
              icon: Icon(Icons.home),
              label: Text('Homepage'),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              onPressed: () {
                Get.offAllNamed(Routes.HOME);
              },
            ),
            ElevatedButton(
              child: Text('Post one more'),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
        _titleController.clear();
        _postContentController.clear();
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    _titleController.dispose();
    _postContentController.dispose();
  }
}
