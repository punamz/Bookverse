import 'package:bookverse/src/presentation/view/home/home_ctrl.dart';
import 'package:bookverse/src/presentation/view/home/home_view.dart';
import 'package:bookverse/src/presentation/view/story/story_ctrl.dart';
import 'package:bookverse/src/presentation/view/story/story_view.dart';
import 'package:bookverse/src/presentation/view/story_detail/story_detail_ctrl.dart';
import 'package:bookverse/src/presentation/view/story_detail/story_detail_view.dart';
import 'package:bookverse/src/presentation/view/story_reading/story_reading_ctrl.dart';
import 'package:bookverse/src/presentation/view/story_reading/story_reading_view.dart';
import 'package:get/get.dart';

class RouterConfigs {
  static final routes = [
    GetPage(
      name: HomeView.routeName,
      page: () => const HomeView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => HomeController());
      }),
    ),
    GetPage(
      name: StoryView.routeName,
      page: () => const StoryView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => StoryController());
      }),
    ),
    GetPage(
      name: StoryDetailView.routeName,
      page: () => const StoryDetailView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => StoryDetailController());
      }),
    ),
    GetPage(
      name: StoryReadingView.routeName,
      page: () => const StoryReadingView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => StoryReadingController());
      }),
    ),
  ];
}
