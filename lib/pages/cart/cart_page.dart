import 'package:flutter/material.dart';
import 'package:food_delivary_app/pages/home/main_food_page.dart';
import 'package:food_delivary_app/utils/dimansiontions.dart';
import 'package:food_delivary_app/widgets/app_icon.dart';
import 'package:food_delivary_app/widgets/big_text.dart';
import 'package:food_delivary_app/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20*3,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: Colors.blue,
                    size: Dimensions.iconSize24*2,
                  ),
                  SizedBox(width: Dimensions.width20*5,),
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>MainFoodPage());
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: Colors.blue,
                      size: Dimensions.iconSize24*2,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    backgroundColor: Colors.blue,
                    size: Dimensions.iconSize24*2,
                  ),
                ],
              )),
          Positioned(
              top: Dimensions.height20*5,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height15),
                color: Colors.white,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (_,index){
                        return Container(
                          width: double.maxFinite,
                          height: Dimensions.height20*5,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: Dimensions.height10),
                                width: Dimensions.height20*5,
                                height: Dimensions.height20*5,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      "assets/images/pizza_1.jpg",
                                    )
                                  ),
                                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: Dimensions.width10,),
                              Expanded(child: Container(
                                height: Dimensions.height20*5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    BigText(text: "Bitter Orange Juice", color: Colors.black54,),
                                    SmallText(text: "Spicy"),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        BigText(text: "\$ 33.0", color: Colors.redAccent,),
                                        Container(
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.circular(Dimensions.radius20),

                                          ),
                                          child: Row(
                                            children: [
                                              Icon(Icons.remove,color: Colors.black,),
                                              SizedBox(width: Dimensions.width10/2),
                                              BigText(text: "0"),
                                              SizedBox(width: Dimensions.width10/2),
                                              Icon(Icons.add,color: Colors.black,),

                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        );
                      }),
                ),
          ))
        ],
      ),
    );
  }
}
