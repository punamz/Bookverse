import 'package:bookverse/core/utils.dart';
import 'package:bookverse/src/domain/model/category_model.dart';
import 'package:bookverse/src/domain/model/story_model.dart';
import 'package:bookverse/src/domain/service/category_service.dart';
import 'package:get/get.dart';

class StoryController extends GetxController {
  final CategoryModel category = Get.arguments;
  final RxList<StoryModel> stories = <StoryModel>[].obs;
  final RxBool isGettingData = true.obs;
  final RxBool canLoadMore = true.obs;
  final RxBool isLoadingMore = false.obs;
  int _page = 0;

  @override
  void onInit() {
    super.onInit();
    _getStories(_page);
  }

  Future _getStories(int page) async {
    final CategoryService categoryService = Get.find();
    final res = await categoryService.getStoriesByCategoryId(category.id ?? 0, page: page);
    res.fold(
      (failure) {
        Utility.showSnackBarError(failure);
        canLoadMore.call(false);
      },
      (value) {
        stories.addAll(value);

        if (value.isEmpty) canLoadMore.call(false);
      },
    );
    isGettingData.call(false);
  }

  Future<void> getMoreStories() async {
    if (isLoadingMore.isTrue) return;

    isLoadingMore.call(true);
    await _getStories(++_page);
    isLoadingMore.call(false);
  }

  Future<void> refreshData() async {
    isGettingData.call(true);
    canLoadMore.call(true);
    stories.clear();
    isLoadingMore.call(false);
    _page = 0;
    await _getStories(_page);
  }
}
