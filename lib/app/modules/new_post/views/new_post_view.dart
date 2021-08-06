import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_post_controller.dart';

class NewPostView extends GetView<NewPostController> {
  final deviceWidth = Get.width;
  final deviceHeight = Get.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Post'),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.all(deviceWidth * 0.025),
            child: IconButton(
              icon: Icon(Icons.check),
              tooltip: 'Publish',
              onPressed: controller.publishPost,
            ),
          ),
          CloseButton(
            onPressed: () {
              Get.back(
                closeOverlays: true,
              );
            },
          ),
        ],
      ),
      body: Card(
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: controller.titleController,
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
                  controller.titleController.text = value;
                },
              ),
              Expanded(
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.postContentController,
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
                        controller.postContentController.text = value;
                      },
                    ),
                    SizedBox(height: deviceHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                          child: Text('Publish'),
                          onPressed: controller.publishPost,
                        ),
                        SizedBox(
                          width: deviceWidth * 0.05,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.redAccent),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                          child: Text('Cancel'),
                          onPressed: () {
                            Get.back(
                              closeOverlays: true,
                            );
                          },
                        ),
                        SizedBox(
                          width: deviceWidth * 0.05,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
