import 'package:bookverse/src/presentation/custom_widget/circle_image_widget.dart';
import 'package:bookverse/src/presentation/custom_widget/loading_widget.dart';
import 'package:bookverse/src/presentation/view/story_detail/child_widget/chapters_widget.dart';
import 'package:bookverse/src/presentation/view/story_detail/child_widget/story_info_widget.dart';
import 'package:bookverse/src/presentation/view/story_detail/story_detail_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class StoryDetailView extends GetView<StoryDetailController> {
  static const String routeName = '/story_detail_view';
  const StoryDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: context.theme.colorScheme.background,
          systemNavigationBarColor: context.theme.colorScheme.background,
        ),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: Obx(
        () => AnimatedCrossFade(
          firstChild: const Center(child: LoadingWidget(canDismiss: true)),
          secondChild: SizedBox(
            height: context.height,
            width: context.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Center(
                          child: CircleImageWidget(
                            size: 150,
                            imageUrl: controller.storyDetail.poster ?? '',
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          controller.storyDetail.title ?? '',
                          style: context.textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                        StoryInfoWidget(storyDetail: controller.storyDetail),
                        const Divider(),
                        Text(controller.storyDetail.description?.last ?? ''),
                        const Divider(),
                        Obx(
                          () => ChaptersWidget(
                            chapters: controller.chapters.value,
                            onSelectChapter: controller.selectChapter,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: controller.startReadingStory,
                      child: const Text('ĐỌC TRUYỆN'),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          crossFadeState: controller.isGettingStoryDetail.isTrue
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 410),
          secondCurve: Curves.decelerate,
          firstCurve: Curves.decelerate,
          sizeCurve: Curves.decelerate,
        ),
      ),
    );
  }
}
