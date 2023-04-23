import 'package:bookverse/core/extension.dart';
import 'package:bookverse/src/domain/model/story_detail_model.dart';
import 'package:bookverse/src/presentation/view/story_detail/child_widget/star_rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoryInfoWidget extends StatelessWidget {
  final StoryDetailModel storyDetail;
  const StoryInfoWidget({Key? key, required this.storyDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 5,
          children: List.generate(
            storyDetail.categoryList?.length ?? 0,
            (index) => DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: context.theme.colorScheme.secondaryContainer,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  storyDetail.categoryList![index],
                  textAlign: TextAlign.center,
                  style: context.textTheme
                      .apply(bodyColor: context.theme.colorScheme.onSecondaryContainer)
                      .labelMedium,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        _BasicPropWidget(
          label: 'Tác giả: ',
          value: storyDetail.author,
        ),
        Row(
          children: [
            Text(
              'Trạng thái: ',
              style: context.textTheme.labelMedium,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: storyDetail.status == 'Full'
                    ? context.theme.colorScheme.primary
                    : context.theme.colorScheme.error,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                ' ${storyDetail.status} ',
                style: context.textTheme
                    .apply(
                      bodyColor: storyDetail.status == 'Full'
                          ? context.theme.colorScheme.onPrimary
                          : context.theme.colorScheme.onError,
                    )
                    .titleMedium,
              ),
            ),
          ],
        ),
        _BasicPropWidget(
          label: 'Phát hành: ',
          value: storyDetail.uploadDate?.format('MM/yyyy'),
        ),
        _BasicPropWidget(
          label: 'Cập nhật: ',
          value: storyDetail.latestUpdatedDate?.format('dd/MM/yyyy'),
        ),
        Row(
          children: [
            Text(
              'Đánh giá: ',
              style: context.textTheme.labelMedium,
            ),
            StarRatingWidget(rating: storyDetail.rateAvg, size: 20),
            Text(
              ' (${storyDetail.rateCount})',
              style: context.textTheme.titleMedium,
            ),
          ],
        ),
      ],
    );
  }
}

class _BasicPropWidget extends StatelessWidget {
  final String label;
  final String? value;
  const _BasicPropWidget({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: label,
            style: context.textTheme.labelMedium,
          ),
          TextSpan(
            text: value,
            style: context.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
