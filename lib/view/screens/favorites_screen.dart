import 'package:ecommerce/logic/controller/product_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import '../widgets/favorites/no_favorites.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);
  var controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(
        () {
          if(controller.favoriteList.isEmpty){
            return const NoFavorites();
          }else{return ListView.separated(
            itemBuilder: (context, index) =>
                favouriteItem(controller.favoriteList.value[index]),
            itemCount: controller.favoriteList.length,
            separatorBuilder: (BuildContext context, int index) =>
                separatorItem(),
          );}
        }
      ),
    );
  }

  Widget favouriteItem(model) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    model.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title,
                    maxLines: 2,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    '${model.price} \$',
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color:Get.isDarkMode?yellowEmadClr: mainColor),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  controller.addToFavorites(model.id);
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }

  Widget separatorItem() {
    return Divider(
      height: 5,
      thickness: 1.1,
      color:Get.isDarkMode?yellowEmadClr: Colors.black,
    );
  }
}
