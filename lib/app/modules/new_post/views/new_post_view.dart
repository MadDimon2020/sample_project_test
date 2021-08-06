import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sample_project/app/routes/app_pages.dart';
import 'package:sample_project/controllers/api_controller.dart';
import 'package:sample_project/generated/graphql/api.graphql.dart';

import '../controllers/new_post_controller.dart';

class NewPostView extends GetView<NewPostController> {
  final deviceWidth = Get.width;
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
            margin: EdgeInsets.all(deviceWidth * 0.025),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: Text('Publish'),
              onPressed: () async {
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
                        name: 'NewPostView');
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
                          'Your post "${_titleController.text}" has been published.',
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
                            _titleController.clear();
                            _postContentController.clear();
                            Get.back();
                          },
                        ),
                      ],
                    );
                  }
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(deviceWidth * 0.025),
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
                  minLines: 2,
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
