import 'package:get/get.dart';

class NewPostController extends GetxController {
  static NewPostController get to => Get.find<NewPostController>();

  static String addNewPost = '''
mutation addNewPost(\$content: String, \$title: String) {
  insert_news_one(object: {content: \$content, title: \$title}) {
    title
    content
    created_at
    id
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
