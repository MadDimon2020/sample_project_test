import 'package:get/get.dart';

class PostDetailsController extends GetxController {
  static PostDetailsController get to => Get.find<PostDetailsController>();
  static String fetchPostByIdQuery = '''
query fetchPostByIdQuery(\$id: uuid!) {
  news_by_pk(id: \$id) {
    content
    created_at
    id
    title
  }
}
 ''';

  final _postId = Get.arguments[0] as String;
  String get postId => _postId;

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
