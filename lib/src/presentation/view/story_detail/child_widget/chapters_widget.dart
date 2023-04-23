import 'package:bookverse/src/domain/model/chapter_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChaptersWidget extends StatelessWidget {
  final List<ChapterModel> chapters;
  final void Function(ChapterModel chapter) onSelectChapter;
  const ChaptersWidget({Key? key, required this.chapters, required this.onSelectChapter})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Các chương: (${chapters.length})',
            style: context.textTheme.titleMedium,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListView.builder(
                itemCount: chapters.length,
                itemBuilder: (context, index) => Card(
                  child: InkWell(
                    onTap: () => onSelectChapter.call(chapters[index]),
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      child: Text(chapters[index].header ?? ''),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
