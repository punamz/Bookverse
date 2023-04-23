import 'package:bookverse/core/constant.dart';
import 'package:bookverse/core/utils.dart';
import 'package:bookverse/src/domain/model/chapter_detail_model.dart';
import 'package:bookverse/src/domain/model/chapter_model.dart';
import 'package:bookverse/src/domain/model/chapter_reading_argument.dart';
import 'package:bookverse/src/domain/service/chapter_service.dart';
import 'package:bookverse/src/infrastructure/local_database/local_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoryReadingController extends GetxController {
  final List<ChapterModel> chapters = [];
  RxInt index = 0.obs;
  late final PageController pageController;
  final RxBool isDartMode = false.obs;
  final RxDouble fontSize = 20.0.obs;

  @override
  void onInit() {
    super.onInit();
    _handleArgument();
    _getLocalSetting();
  }

  void _handleArgument() {
    final StoryReadingArgument argument = Get.arguments;
    chapters.addAll(argument.chapters);
    index.call(argument.startIndex);
    pageController = PageController(initialPage: argument.startIndex);
  }

  void _getLocalSetting() {
    final double sizeSaved = Storage.instance.readDouble(Constant.fontSize);
    if (sizeSaved != 0) fontSize.call(sizeSaved);
    final bool themeSaved = Storage.instance.readBool(Constant.lightMode);
    isDartMode.call(themeSaved);
  }

  Future<ChapterDetailModel?> getChapterDetail(ChapterModel chapter) async {
    final ChapterService chapterService = Get.find();
    final res = await chapterService.getChapterDetail(chapter.id ?? 0);
    return res.fold(
      (failure) {
        Utility.showSnackBarError(failure);
        return null;
      },
      (value) => value,
    );
  }

  void setDarkThemeMode(bool value) {
    isDartMode.call(value);
    Storage.instance.writeBool(Constant.lightMode, value);
  }

  void saveFontSize(double value) {
    Storage.instance.writeDouble(Constant.fontSize, value);
  }
}
