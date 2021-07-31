import 'dart:developer';

import 'package:get/get.dart';
import 'package:sample_project/app/base/utils/db_helper.dart';
import 'package:sqflite/sqflite.dart' as sql;

class HomeController extends GetxController {
  static HomeController get to => Get.find<HomeController>();

//   static String newsSubscription = '''
// subscription newsFeedSubscription {
//   news(order_by: {created_at: desc}) {
//     content
//     created_at
//     id
//     title
//   }
// }
// ''';

  static sql.Database _readingListDB;
  sql.Database get readingListDB => _readingListDB;
  static List<String> _readingList;
  List<String> get readingList => _readingList;

  Future<void> insertToReadingList(Map<String, Object> data) async {
    await _readingListDB.insert('post_ids', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    log('The following data has been inserted to the local database: $data',
        name: 'DBHelper.insert');
  }

  @override
  void onInit() async {
    super.onInit();
    _readingListDB = await DBHelper.initDataBase();
    List<Map<String, dynamic>> dataList = await DBHelper.getData('post_ids');
    print('The Database contains the data: $dataList');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
