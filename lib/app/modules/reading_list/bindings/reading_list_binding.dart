import 'package:get/get.dart';

import '../controllers/reading_list_controller.dart';

class ReadingListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReadingListController>(
      () => ReadingListController(),
    );
  }
}
