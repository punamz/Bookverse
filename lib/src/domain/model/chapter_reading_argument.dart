import 'package:bookverse/src/domain/model/chapter_model.dart';

class StoryReadingArgument {
  final List<ChapterModel> chapters;
  final int startIndex;

  StoryReadingArgument({required this.chapters, required this.startIndex});
}
