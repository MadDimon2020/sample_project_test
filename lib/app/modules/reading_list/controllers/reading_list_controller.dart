import 'package:get/get.dart';

class ReadingListController extends GetxController {
  static String readingList = '''
query ReadingList(\$_in: [uuid!]) {
  news_aggregate(where: {id: {_in: \$_in}}) {
    nodes {
      content
      created_at
      id
      title
    }
  }
}
''';

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
