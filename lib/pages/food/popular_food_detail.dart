import 'package:flutter/material.dart';
import 'package:food_delivary_app/controller/populer_product_controller.dart';
import 'package:food_delivary_app/pages/cart/cart_page.dart';
import 'package:food_delivary_app/pages/home/main_food_page.dart';
import 'package:food_delivary_app/utils/dimansiontions.dart';
import 'package:food_delivary_app/widgets/app_column.dart';
import 'package:food_delivary_app/widgets/app_icon.dart';
import 'package:food_delivary_app/widgets/big_text.dart';
import 'package:food_delivary_app/widgets/expanable_text_widget.dart';
import 'package:get/get.dart';



void main(){
  runApp(MaterialApp(title: "Popoular",));
}

class PopularFoodDetail extends StatefulWidget {
  //int pageId;
   PopularFoodDetail({Key? key}) : super(key: key);

  @override
  State<PopularFoodDetail> createState() => _PopularFoodDetailState();
}

class _PopularFoodDetailState extends State<PopularFoodDetail> {
  @override
  Widget build(BuildContext context) {

    //page id is not called because of api
    // var product=Get.find<PopularProductController>().popularProductList[widget.pageId];
    // print("PageId"+widget.pageId.toString());
    // print("Product Name is"+widget.nam)
    return Scaffold(
      backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              left: 0,
                right: 0,
                child: Container(
                  height: Dimensions.popularFoodImage,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/images/pizza_1.jpg",
                      )
                    )
                  ),

                )
            ),
            Positioned(
              top: Dimensions.height45,
                left: Dimensions.width20,
                right: Dimensions.width20,
                

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  GestureDetector(
                      onTap: (){
                        Get.to(()=> MainFoodPage());
                      },child:  AppIcon(icon: Icons.arrow_back_ios)),
                   GestureDetector(
                     onTap: (){
                       Get.to(()=>CartPage());
                     },
                       child: AppIcon(icon: Icons.shopping_cart_outlined)),
              ],
            )),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: Dimensions.popularFoodImage-20,
                child: Container(
                  padding: EdgeInsets.only(
                  left: Dimensions.width20,
                      right: Dimensions.width20,
                  top: Dimensions.height20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20),
                    ),
                    color: Colors.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(text: "Badam Pizza",),
                      SizedBox(height: Dimensions.height20,),
                      BigText(text: "Introduce",size: 20,),
                      SizedBox(height: Dimensions.height20,),

                      Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(

                        text: "Badam Pizza in a pizza,pizza,This Pizza is delicusise , Pizza flavored almonds are a type of snack food that has been flavored to taste like pizza. They are typically made by coating almonds in a seasoning blend that includes ingredients commonly found in pizza, such as tomato powder, cheese powder, and herbs. klsfkllksafjjkljkasfjkkadsf jijsdfd n m,lkijdsjfsfjjkdf  jsdfkljdsfdsakfjksadfsdjf kokfsdfdsklfkfadsjfsdf jojsdfjsdfjsadfjsdfjosfsdjf pojdsjfafjdsfjdsfopsdajopfsdjopf ksdfopjdsfjsadfdsnklfsdfgj9gfsgsdf jdfdsjpofjsdafsdajfdsajfsdfjsedf fjpofsdfpsadfjopsdjfsdfdskjfojmjo dsjpofsdfjpdfjdsopfjopsfjopsdfjuopsdfp jdspfdsjfdsfijosdof9wesfudsjlkfasdjofsdjpjopjpofdoewriwejsg'p"
                            "gsffsdfs jofsdfsdjfjdslfjsdfjlkdsfdsfjsdafjdslfjfdsfj;f fojsfjsfpsdfopsdjofjdsopfjdosfjpodsfpjasdfsdf fojsfjodsfjosdfjosjopfjsdfdsfjsdjopf ksfsdfsdfsdfsifijdshnifhdsf hdhsafsdfhiadhfsil",                    ),
                  ),)
                ]
                  ),
            ))
          ]),
        bottomNavigationBar: Container(
          height: 120,
            padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height30,
              left: Dimensions.width20,
            right: Dimensions.width20),
        decoration: BoxDecoration(
          color:Colors.black12,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2)
          )
        ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween
            ,
            children: [
              Container(
                padding: EdgeInsets.all(20),
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
              Container(
                  padding: EdgeInsets.all(20),

                  decoration: BoxDecoration(
                  color:Colors.blue,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                ),
                child: BigText(text: "\$10 | Add to cart",color: Colors.white,)
              ),
            ],
          ),
        ),
    );
  }
}
