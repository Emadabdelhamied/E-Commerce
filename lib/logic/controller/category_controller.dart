import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/services/category_services.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var categoryList = <String>[].obs;
  var allCategoryList = <ProductModel>[].obs;
  var isCategoryLoading = false.obs;
  var isAllCategory = false.obs;
  @override
  void onInit() {
    super.onInit();
    getCategories();
  }

  void getCategories() async {
    var categoryNames = await CategoryServices.getCategory();
    try {
      isCategoryLoading(true);
      if (categoryList.isEmpty) {
        categoryList.addAll(categoryNames);
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  getAllCategories(String categoryName) async {
    isAllCategory(true);
    allCategoryList.value = await CategoryServices.getAllCategory(categoryName);
    isAllCategory(false);
  }

  getCategoryIndex(int index) async {
    var categoryAllName = await getAllCategories(categoryList[index]);

    if (categoryAllName != null) {
      allCategoryList.value = categoryAllName;
    }
  }
}
