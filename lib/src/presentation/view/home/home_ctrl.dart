import 'package:bookverse/core/utils.dart';
import 'package:bookverse/src/domain/model/category_model.dart';
import 'package:bookverse/src/domain/service/category_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxBool isGettingData = true.obs;
  final List<CategoryModel> categories = <CategoryModel>[];

  @override
  void onInit() {
    super.onInit();
    _getCategory();
  }

  Future _getCategory() async {
    final CategoryService categoryService = Get.find();
    final res = await categoryService.getAllCategories();
    res.fold(
      (failure) => Utility.showSnackBarError(failure),
      (value) => categories.addAll(value),
    );
    isGettingData.call(false);
  }
}
