import 'dart:convert';

import 'package:bookverse/core/api_endpoint.dart';
import 'package:bookverse/src/domain/model/chapter_model.dart';
import 'package:bookverse/src/domain/model/story_detail_model.dart';
import 'package:bookverse/src/domain/service/core_http_service.dart';
import 'package:bookverse/src/domain/service/story_service.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class StoryRepository implements StoryService {
  final CoreHttpService _coreHttpService = Get.find();
  @override
  Future<Either<String, StoryDetailModel>> getStoryDetail(int id) async {
    try {
      final response = await _coreHttpService.get('${ApiEndpoint.story}$id');
      var data = jsonDecode(response.data);
      return response.statusCode == 200
          ? Right(StoryDetailModel.fromJson(data))
          : const Left('Invalid data');
    } catch (e) {
      return const Left('It seems that the server is not reachable at the moment, try again later');
    }
  }

  @override
  Future<Either<String, List<ChapterModel>>> getChaptersByStorySlug(String slug) async {
    try {
      final response = await _coreHttpService.get(
        ApiEndpoint.chapterByStory.replaceAll('{?}', slug),
      );
      var data = jsonDecode(response.data);
      return response.statusCode == 200
          ? Right(List<ChapterModel>.from(data.map((x) => ChapterModel.fromJson(x))))
          : const Left('Invalid data');
    } catch (e) {
      return const Left('It seems that the server is not reachable at the moment, try again later');
    }
  }
}
