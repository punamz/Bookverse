import 'package:bookverse/src/domain/service/category_service.dart';
import 'package:bookverse/src/domain/service/chapter_service.dart';
import 'package:bookverse/src/domain/service/core_http_service.dart';
import 'package:bookverse/src/domain/service/story_service.dart';
import 'package:bookverse/src/infrastructure/repository/category_repository.dart';
import 'package:bookverse/src/infrastructure/repository/chapter_repository.dart';
import 'package:bookverse/src/infrastructure/repository/core_http_implement.dart';
import 'package:bookverse/src/infrastructure/repository/story_repository.dart';
import 'package:get/get.dart';

/// global binding for app
/// binding all service
class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoreHttpService>(() => CoreHttpImplement(), fenix: true);
    Get.lazyPut<CategoryService>(() => CategoryRepository(), fenix: true);
    Get.lazyPut<ChapterService>(() => ChapterRepository(), fenix: true);
    Get.lazyPut<StoryService>(() => StoryRepository(), fenix: true);
  }
}
