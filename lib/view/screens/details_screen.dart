import 'package:eco/core/const/colors.dart';
import 'package:eco/core/view_model/cart_view_model.dart';
import 'package:eco/model/cart_model.dart';
import 'package:eco/model/product_model.dart';
import 'package:eco/view/widgets/custom_button.dart';
import 'package:eco/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  ProductModel? model;
  DetailsScreen({this.model, super.key});
//#3314078
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: Image.network(
                    model!.image!,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 48, // Adjust the position as needed
                  right: 10, // Adjust the position as needed
                  child: GetBuilder<CartViewModel>(
                    init: CartViewModel(),
                    builder: (controller) => IconButton(
                      tooltip: 'Add to favorite',
                      icon: controller.isFavorite(model!.id!)
                          ? CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 17,
                              ),
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.favorite_border,
                                  color: Colors.red, size: 17),
                            ),
                      onPressed: () {
                        controller.addFavorite(CartModel(
                            image: model!.image,
                            quantity: 1,
                            name: model!.name,
                            price: model!.price,
                            id: model!.id));
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 55, 
                  left: 10, 
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: Center(
                      child: IconButton(
                        icon:  Icon(Icons.arrow_back_ios_new_rounded,
                        color: Colors.black,
                        size: 15,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: model!.name,
                            fontSize: 20,
                            //alignment: Alignment.topLeft,
                          ),
                          CustomText(
                            text: model!.price! + '\$',
                            fontSize: 18,
                            color: AppColors.primaryColor,
                            //alignment: Alignment.topLeft,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: 'Details',
                        fontSize: 18,
                        color: AppColors.primaryColor,
                        alignment: Alignment.bottomLeft,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        //height: 2.5,
                        text: model!.desc,
                        fontSize: 16,
                        alignment: Alignment.bottomLeft,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: 'Color',
                        alignment: Alignment.topLeft,
                        color: AppColors.primaryColor,
                        fontSize: 18,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(model!.color!),
                            borderRadius: BorderRadius.circular(5)),
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: 'Size',
                        alignment: Alignment.topLeft,
                        color: AppColors.primaryColor,
                        fontSize: 18,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width * .4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey)),
                            child: CustomText(
                              alignment: Alignment.center,
                              text: model!.sized,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: GetBuilder<CartViewModel>(
                builder: (controller) => Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: CustomButton(
                      text: 'ADD TO CART',
                      onTap: () {
                        print('mkdkmmvlsmlkm');
                        controller.addProduct(CartModel(
                          name: model!.name,
                          image: model!.image,
                          price: model!.price,
                          quantity: 1,
                          id: model!.id,
                        ));
                      },
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
