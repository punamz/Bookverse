import 'package:bookverse/core/assets.dart';
import 'package:bookverse/src/domain/model/chapter_detail_model.dart';
import 'package:bookverse/src/domain/model/chapter_model.dart';
import 'package:bookverse/src/presentation/custom_widget/loading_widget.dart';
import 'package:bookverse/src/presentation/view/story_reading/story_reading_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ChapterPageView extends StatefulWidget {
  final ChapterModel chapterModel;
  const ChapterPageView({
    Key? key,
    required this.chapterModel,
  }) : super(key: key);

  @override
  State<ChapterPageView> createState() => _ChapterPageViewState();
}

class _ChapterPageViewState extends State<ChapterPageView>
    with AutomaticKeepAliveClientMixin<ChapterPageView> {
  StoryReadingController get controller => Get.find();
  final Rxn<ChapterDetailModel> chapterDetail = Rxn<ChapterDetailModel>(null);
  final RxBool isGettingData = true.obs;

  @override
  void initState() {
    super.initState();
    _getChapterDetail();
  }

  _getChapterDetail() async {
    final ChapterDetailModel? chapter = await controller.getChapterDetail(widget.chapterModel);
    chapterDetail.call(chapter);
    isGettingData.call(false);
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(
      () => isGettingData.isTrue
          ? const Center(child: LoadingWidget(canDismiss: true))
          : chapterDetail.value == null
              ? Center(child: Lottie.asset(AnimationAssets.error))
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView(
                    children: List.generate(
                      chapterDetail.value?.body?.length ?? 0,
                      (index) => Obx(
                        () => Html(
                          data: chapterDetail.value?.body?[index],
                          style: {
                            'p': Style(
                              fontSize: FontSize(controller.fontSize.value),
                              color: controller.isDartMode.isTrue ? Colors.white : Colors.black,
                            ),
                          },
                        ),
                      ),
                    ),
                  ),
                ),
    );
  }
}
