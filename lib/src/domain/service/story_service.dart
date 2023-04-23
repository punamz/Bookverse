import 'package:bookverse/src/domain/model/chapter_model.dart';
import 'package:bookverse/src/domain/model/story_detail_model.dart';
import 'package:dartz/dartz.dart';

abstract class StoryService {
  Future<Either<String, StoryDetailModel>> getStoryDetail(int id);
  Future<Either<String, List<ChapterModel>>> getChaptersByStorySlug(String slug);
}
