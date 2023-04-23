import 'package:bookverse/src/domain/model/story_model.dart';
import 'package:bookverse/src/presentation/custom_widget/listview_load_more_widget.dart';
import 'package:bookverse/src/presentation/view/story/child_widget/story_item_widget.dart';
import 'package:bookverse/src/presentation/view/story/child_widget/story_loading_widget.dart';
import 'package:bookverse/src/presentation/view/story/story_ctrl.dart';
import 'package:bookverse/src/presentation/view/story_detail/story_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoryView extends GetView<StoryController> {
  static const String routeName = '/story_view';
  const StoryView({Key? key}) : super(key: key);

  void _onSelectStory(StoryModel story) => Get.toNamed(StoryDetailView.routeName, arguments: story);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.category.name ?? ''),
      ),
      body: Obx(
        () => AnimatedCrossFade(
          firstChild: const StoryLoadingWidget(),
          secondChild: SizedBox(
            height: context.height,
            width: context.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: RefreshIndicator(
                onRefresh: controller.refreshData,
                child: Obx(
                  () => ListViewLoadMoreWidget(
                    itemCount: controller.stories.length,
                    itemBuilder: (context, index) => StoryItemWidget(
                      story: controller.stories[index],
                      onSelect: _onSelectStory,
                    ),
                    funcLoadMore: controller.getMoreStories,
                    canLoadMore: controller.canLoadMore.stream,
                    showLoading: controller.isLoadingMore.stream,
                  ),
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
          sizeCurve: Curves.decelerate,
        ),
      ),
    );
  }
}
