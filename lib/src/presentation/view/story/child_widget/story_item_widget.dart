import 'package:bookverse/core/extension.dart';
import 'package:bookverse/src/domain/model/story_model.dart';
import 'package:bookverse/src/presentation/custom_widget/circle_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoryItemWidget extends StatelessWidget {
  final StoryModel story;
  final void Function(StoryModel story) onSelect;
  const StoryItemWidget({Key? key, required this.story, required this.onSelect}) : super(key: key);

  bool get isFull => story.status == 'Full';

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => onSelect.call(story),
        borderRadius: BorderRadius.circular(12),
        child: ClipRect(
          child: Banner(
            message: story.status ?? '',
            location: BannerLocation.topEnd,
            color: isFull ? context.theme.colorScheme.primary : context.theme.colorScheme.error,
            textStyle: context.textTheme
                .apply(
                    bodyColor: isFull
                        ? context.theme.colorScheme.onPrimary
                        : context.theme.colorScheme.onError)
                .labelSmall!,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                children: [
                  CircleImageWidget(size: 70, imageUrl: story.poster ?? ''),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          story.title ?? '',
                          style: context.textTheme.titleMedium,
                        ),
                        Text(
                          story.author ?? '',
                          style: context.textTheme.bodyMedium,
                        ),
                        Text(
                          story.updatedDate?.format('HH:mm dd/MM/yyyy') ?? '',
                          style: context.textTheme.bodySmall,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
