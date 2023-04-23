import 'dart:convert';

import 'package:bookverse/core/api_endpoint.dart';
import 'package:bookverse/src/domain/model/chapter_detail_model.dart';
import 'package:bookverse/src/domain/service/chapter_service.dart';
import 'package:bookverse/src/domain/service/core_http_service.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class ChapterRepository implements ChapterService {
  final CoreHttpService _coreHttpService = Get.find();
  @override
  Future<Either<String, ChapterDetailModel>> getChapterDetail(int id) async {
    try {
      final response = await _coreHttpService.get('${ApiEndpoint.chapter}$id');
      var data = jsonDecode(response.data);
      return response.statusCode == 200
          ? Right(ChapterDetailModel.fromJson(data))
          : const Left('Invalid data');
    } catch (e) {
      return const Left('It seems that the server is not reachable at the moment, try again later');
    }
  }
}
