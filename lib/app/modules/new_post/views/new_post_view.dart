import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sample_project/app/routes/app_pages.dart';
import 'package:sample_project/controllers/api_controller.dart';

import '../controllers/new_post_controller.dart';

class NewPostView extends GetView<NewPostController> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _postContentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Post'),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.all(10),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: Text('Publish'),
              onPressed: () async {
                final formIsValid = _formKey.currentState.validate();
                if (formIsValid) {
                  await ApiController.mutate(
                    MutationOptions(
                      document: gql(NewPostController.addNewPost),
                      variables: {
                        'title': _titleController.text,
                        'content': _postContentController.text,
                      },
                      fetchPolicy: FetchPolicy.networkOnly,
                      onError: (error) {
                        Get.snackbar(
                          'Error',
                          '${error.graphqlErrors.toString()}',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                        log(error.graphqlErrors.toString(),
                            name: 'ApiController');
                      },
                      onCompleted: (data) {
                        print(data);
                      },
                    ),
                  );
                }
                Get.snackbar(
                  'Congratulations!',
                  'Your post ${_titleController.text} has been published',
                  snackPosition: SnackPosition.BOTTOM,
                  mainButton: TextButton(
                    child: Text('Got it'),
                    onPressed: () {
                      Get.offNamed(Routes.HOME);
                    },
                  ),
                );
                Get.offNamed(Routes.HOME);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey[700]),
              ),
              child: Text('Cancel'),
              onPressed: () {
                Get.back(
                  closeOverlays: true,
                );
              },
            ),
          ),
        ],
      ),
      body: Card(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the title of your post.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                textCapitalization: TextCapitalization.words,
                onSaved: (value) {
                  _titleController.text = value;
                },
              ),
              Expanded(
                child: TextFormField(
                  controller: _postContentController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some description.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Description',
                    alignLabelWithHint: true,
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: null,
                  onSaved: (value) {
                    _postContentController.text = value;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
