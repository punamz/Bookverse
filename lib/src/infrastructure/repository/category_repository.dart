import 'dart:convert';

import 'package:bookverse/core/api_endpoint.dart';
import 'package:bookverse/src/domain/model/category_model.dart';
import 'package:bookverse/src/domain/model/story_model.dart';
import 'package:bookverse/src/domain/service/category_service.dart';
import 'package:bookverse/src/domain/service/core_http_service.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class CategoryRepository implements CategoryService {
  final CoreHttpService _coreHttpService = Get.find();
  @override
  Future<Either<String, List<CategoryModel>>> getAllCategories() async {
    try {
      final response = await _coreHttpService.get(ApiEndpoint.category);
      var data = jsonDecode(response.data);
      return response.statusCode == 200
          ? Right(List<CategoryModel>.from(data.map((x) => CategoryModel.fromJson(x))))
          : const Left('Invalid data');
    } catch (e) {
      return const Left('It seems that the server is not reachable at the moment, try again later');
    }
  }

  @override
  Future<Either<String, List<StoryModel>>> getStoriesByCategoryId(
    int categoryId, {
    int page = 0,
    int limit = 30,
  }) async {
    try {
      final queryParameters = {
        'page': page,
        'limit': limit,
      };
      final response = await _coreHttpService.get(
        ApiEndpoint.storyByCategory.replaceAll('{?}', '$categoryId'),
        queryParameters: queryParameters,
      );
      var data = jsonDecode(response.data);
      return response.statusCode == 200
          ? Right(List<StoryModel>.from(data.map((x) => StoryModel.fromJson(x))))
          : const Left('Invalid data');
    } catch (e) {
      return const Left('It seems that the server is not reachable at the moment, try again later');
    }
  }
}
