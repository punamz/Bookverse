import 'package:bookverse/src/domain/model/category_model.dart';
import 'package:bookverse/src/domain/model/story_model.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryService {
  Future<Either<String, List<CategoryModel>>> getAllCategories();
  Future<Either<String, List<StoryModel>>> getStoriesByCategoryId(
    int categoryId, {
    int page = 0,
    int limit = 30,
  });
}
