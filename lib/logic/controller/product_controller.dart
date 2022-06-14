import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/services/product_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  var productList = [].obs;
  var isLoading = true.obs;
  var favoriteList = [].obs;
  var storage = GetStorage();
  var searchList = [].obs;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    getProducts();
    super.onInit();
    super.onInit();

    List? storedShoppings = storage.read<List>('isFavouritesList');

    if (storedShoppings != null) {
      favoriteList =
          storedShoppings.map((e) => ProductModel.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProducts();
    try {
      isLoading(true);
      if (productList.isEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  void addToFavorites(int productId) async {
    var existingIndex =
        favoriteList.indexWhere((element) => element.id == productId);
    if (existingIndex >= 0) {
      favoriteList.removeAt(existingIndex);
      await storage.remove("isFavouritesList");
    } else {
      favoriteList
          .add(productList.firstWhere((element) => element.id == productId));

      await storage.write("isFavouritesList", favoriteList);
    }
  }

  bool isFavorite(int productId) {
    return favoriteList.any((element) => element.id == productId);
  }

  void createSearchList(String searchName) {
    searchName = searchName.toLowerCase();
    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();
      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();
    update();
  }

  void clearSearchList() {
    searchController.clear();
    createSearchList('');
    update();
  }
}
