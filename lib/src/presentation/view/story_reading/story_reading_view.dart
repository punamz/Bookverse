import 'package:bookverse/src/presentation/view/story_reading/child_widget/chaper_page_view.dart';
import 'package:bookverse/src/presentation/view/story_reading/story_reading_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class StoryReadingView extends GetView<StoryReadingController> {
  static const String routeName = '/story_reading_view';
  const StoryReadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: controller.isDartMode.isTrue ? Colors.black : Colors.white,
        appBar: AppBar(
          backgroundColor: controller.isDartMode.isTrue ? Colors.black : Colors.white,
          foregroundColor: controller.isDartMode.isTrue ? Colors.white : Colors.black,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: controller.isDartMode.isTrue ? Colors.black : Colors.white,
            systemNavigationBarColor: controller.isDartMode.isTrue ? Colors.black : Colors.white,
          ),
          title: Obx(
            () => Text(
              controller.chapters[controller.index.value].header ?? '',
              maxLines: 2,
            ),
          ),
          actions: [
            PopupMenuButton(
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Row(
                    children: [
                      const Expanded(child: Text('Chế độ tối')),
                      Obx(() => Switch(
                            value: controller.isDartMode.value,
                            onChanged: controller.setDarkThemeMode,
                          ))
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      const Expanded(child: Text('')),
                      Obx(() => Slider(
                            value: controller.fontSize.value,
                            onChangeEnd: controller.saveFontSize,
                            onChanged: controller.fontSize.call,
                            min: 10.0,
                            max: 50.0,
                          ))
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        body: PageView(
          onPageChanged: controller.index.call,
          controller: controller.pageController,
          children: List.generate(
            controller.chapters.length,
            (index) => ChapterPageView(chapterModel: controller.chapters[index]),
          ),
        ),
      ),
    );
  }
}
