import 'package:get/get.dart';
import 'package:sample_project/app/modules/home/controllers/home_controller.dart';

class ReadingListController extends GetxController {
  static ReadingListController get to => Get.find<ReadingListController>();
  static String readingList = '''
query ReadingList(\$_in: [uuid!]) {
  news(where: {id: {_in: \$_in}}) {
    content
    created_at
    id
    title
  }
}
''';

  List<dynamic> orderFetchedData(List<dynamic> fetchedData) {
    List<dynamic> orderedList = [];
    if (fetchedData.isNotEmpty) {
      for (int i = 0; i < HomeController.to.readingList.length; i++) {
        orderedList.add(fetchedData.firstWhere(
            (element) => element['id'] == HomeController.to.readingList[i]));
      }
      return orderedList;
    } else
      return null;
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
