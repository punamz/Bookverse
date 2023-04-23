import 'package:bookverse/src/domain/model/category_model.dart';
import 'package:bookverse/src/presentation/view/home/child_widget/category_item_widget.dart';
import 'package:bookverse/src/presentation/view/home/child_widget/home_loading_widget.dart';
import 'package:bookverse/src/presentation/view/home/home_ctrl.dart';
import 'package:bookverse/src/presentation/view/story/story_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  static const String routeName = '/home_view';
  const HomeView({Key? key}) : super(key: key);

  void _onSelectCategory(CategoryModel category) {
    Get.toNamed(StoryView.routeName, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trang chủ')),
      body: Obx(
        () => AnimatedCrossFade(
          firstChild: const HomeLoadingWidget(),
          secondChild: SizedBox(
            height: context.height,
            width: context.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: (controller.categories.length / 2).ceil(),
                itemBuilder: (_, index) => Row(
                  children: [
                    CategoryItemWidget(
                      category: controller.categories[index * 2],
                      onSelect: _onSelectCategory,
                    ),

                    /// check if we have available index
                    if (controller.categories.length > index * 2 + 1) ...[
                      const SizedBox(width: 10),
                      CategoryItemWidget(
                        category: controller.categories[index * 2 + 1],
                        onSelect: _onSelectCategory,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
          crossFadeState: controller.isGettingData.isTrue
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 410),
          secondCurve: Curves.decelerate,
          firstCurve: Curves.decelerate,
        ),
      ),
    );
  }
}
