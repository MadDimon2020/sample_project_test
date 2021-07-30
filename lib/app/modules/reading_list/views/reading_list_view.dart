import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reading_list_controller.dart';

class ReadingListView extends GetView<ReadingListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Reading List'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ReadingListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
