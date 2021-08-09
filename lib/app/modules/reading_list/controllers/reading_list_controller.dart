import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sample_project/app/modules/home/controllers/home_controller.dart';
import 'package:sample_project/generated/graphql/api.graphql.dart';

class ReadingListController extends GetxController {
  static ReadingListController get to => Get.find<ReadingListController>();
  static String readingList = '''
query ReadingList(\$_in: [uuid!]) {
  news(where: {id: {_in: \$_in}}) {
    content
    created_at
    id
    title
    user_id
  }
}
''';

  List<ReadingList$QueryRoot$News> orderFetchedData(
      List<ReadingList$QueryRoot$News> fetchedData) {
    List<ReadingList$QueryRoot$News> orderedList = [];
    if (fetchedData.isNotEmpty) {
      for (int i = 0; i < HomeController.to.readingList.length; i++) {
        orderedList.add(fetchedData.firstWhere(
            (element) => element.id == HomeController.to.readingList[i]));
      }
      return orderedList;
    } else
      return null;
  }

  Future<void> removeFromReadingList(
      {@required String postId,
      Future<QueryResult> Function() refetchFn}) async {
    log('Unsave-button pressed', name: 'ReadingListController');
    await HomeController.to.deleteFromDatabase(postId);
    HomeController.to.deleteFromReadingList(postId);
    refetchFn();
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
  void onClose() {}
}
