import 'package:bookverse/src/domain/model/chapter_detail_model.dart';
import 'package:dartz/dartz.dart';

abstract class ChapterService {
  Future<Either<String, ChapterDetailModel>> getChapterDetail(int id);
}
