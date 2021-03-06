import 'package:get/get.dart';

import 'package:sample_project/app/base/utils/root.dart';
import 'package:sample_project/app/modules/auth/bindings/auth_binding.dart';
import 'package:sample_project/app/modules/auth/views/auth_view.dart';
import 'package:sample_project/app/modules/home/bindings/home_binding.dart';
import 'package:sample_project/app/modules/home/views/home_view.dart';
import 'package:sample_project/app/modules/new_post/bindings/new_post_binding.dart';
import 'package:sample_project/app/modules/new_post/views/new_post_view.dart';
import 'package:sample_project/app/modules/post_details/bindings/post_details_binding.dart';
import 'package:sample_project/app/modules/post_details/views/post_details_view.dart';
import 'package:sample_project/app/modules/reading_list/bindings/reading_list_binding.dart';
import 'package:sample_project/app/modules/reading_list/views/reading_list_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.ROOT;

  static final routes = [
    GetPage(
      name: _Paths.ROOT,
      page: () => Root(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.NEW_POST,
      page: () => NewPostView(),
      binding: NewPostBinding(),
    ),
    GetPage(
      name: _Paths.POST_DETAILS,
      page: () => PostDetailsView(),
      binding: PostDetailsBinding(),
    ),
    GetPage(
      name: _Paths.READING_LIST,
      page: () => ReadingListView(),
      binding: ReadingListBinding(),
    ),
  ];
}
