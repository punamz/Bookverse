import 'package:bookverse/core/utils.dart';
import 'package:bookverse/src/domain/model/chapter_model.dart';
import 'package:bookverse/src/domain/model/chapter_reading_argument.dart';
import 'package:bookverse/src/domain/model/story_detail_model.dart';
import 'package:bookverse/src/domain/model/story_model.dart';
import 'package:bookverse/src/domain/service/story_service.dart';
import 'package:bookverse/src/infrastructure/local_database/local_database.dart';
import 'package:bookverse/src/presentation/view/story_reading/story_reading_view.dart';
import 'package:get/get.dart';

class StoryDetailController extends GetxController {
  final StoryModel _story = Get.arguments;
  final RxBool isGettingStoryDetail = true.obs;
  final RxBool isGettingChapter = true.obs;
  StoryDetailModel storyDetail = StoryDetailModel();
  final RxList<ChapterModel> chapters = <ChapterModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _getStoryDetail();
    _getChapters();
  }

  Future _getStoryDetail() async {
    final StoryService storyService = Get.find();
    final res = await storyService.getStoryDetail(_story.id ?? 0);
    res.fold(
      (failure) => Utility.showSnackBarError(failure),
      (value) => storyDetail = value,
    );
    isGettingStoryDetail.call(false);
  }

  _getChapters() async {
    final StoryService storyService = Get.find();
    final res = await storyService.getChaptersByStorySlug(_story.slug ?? '');
    res.fold(
      (failure) => Utility.showSnackBarError(failure),
      (value) => chapters.addAll(value.reversed),
    );
    isGettingChapter.call(false);
  }

  void selectChapter(ChapterModel chapter) {
    Storage.instance.writeInt(_story.slug ?? '', chapter.id);

    var index = chapters.indexOf(chapter);
    _gotoReadingStory(index);
  }

  void startReadingStory() {
    /// get the last chapter that user read
    final int lastChapterId = Storage.instance.readInt(_story.slug ?? '');

    /// if [lastChapterId] is not equal 0, it means that have last chapter
    int index =
        lastChapterId == 0 ? 0 : chapters.indexWhere((element) => element.id == lastChapterId);

    _gotoReadingStory(index);
  }

  void _gotoReadingStory(int index) {
    final StoryReadingArgument argument = StoryReadingArgument(
      chapters: chapters,
      startIndex: index,
    );
    Get.toNamed(StoryReadingView.routeName, arguments: argument);
  }
}
