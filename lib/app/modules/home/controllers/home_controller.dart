import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sample_project/controllers/api_controller.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find<HomeController>();

  static String newsSubscription = '''
subscription fetchNewsFeed {
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
    ApiController.subscribe(
      SubscriptionOptions(
        document: gql(newsSubscription),
      ),
    );
  }

  @override
  void onClose() {}
}
