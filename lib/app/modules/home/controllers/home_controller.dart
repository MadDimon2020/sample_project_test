import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find<HomeController>();

  static String newsSubscription = '''
subscription newsFeedSubscription {
  news(order_by: {created_at: desc}) {
    content
    created_at
    id
    title
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
