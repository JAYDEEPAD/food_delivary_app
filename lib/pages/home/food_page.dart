import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivary_app/controller/populer_product_controller.dart';
import 'package:food_delivary_app/models/product_model.dart';
import 'package:food_delivary_app/pages/food/popular_food_detail.dart';
import 'package:food_delivary_app/routes/routes_helper.dart';
import 'package:food_delivary_app/utils/app_constants.dart';
import 'package:food_delivary_app/utils/dimansiontions.dart';
import 'package:food_delivary_app/widgets/app_column.dart';
import 'package:food_delivary_app/widgets/big_text.dart';
import 'package:food_delivary_app/widgets/icon_and_text_widget.dart';
import 'package:food_delivary_app/widgets/small_text.dart';
import 'package:get/get.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  PageController pageController=PageController(viewportFraction: 0.9);
  var currentPageValue=0.0;
  double scaleFactor=0.8;
  double height=Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
       currentPageValue=pageController.page!;
       print("Pagevalue is"+currentPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        GetBuilder<PopularProductController>(builder: (popularProducts){
         return  Container(
            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
               itemCount: 5,
               /*Not Fetching Data For Images
                itemCount: popularProducts.popularProductList.length,*/
                itemBuilder: (context,position){
                 /* Data Was Not Set For Image Change Position
                  return _buildItemPage(position,popularProducts.popularProductList[position]);*/
                  return _buildItemPage(position);
                }),
          );
        }),

        GetBuilder<PopularProductController>(builder: (popularProducts){
              return DotsIndicator(
                dotsCount: 5,
                /*
                dotsCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,
                Not Fetching Data of Dots
                 */
                position: currentPageValue,
                decorator: DotsDecorator(
                  activeColor:Colors.blue ,
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              );
        }),

        //Popular Text
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".",color:Colors.black),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food Pairing",),
              ),

            ],
          ),
        ),
        //List of Food and Images
        ListView.builder(physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              Get.toNamed(RouteHelper.getRecommandedFood());
            },
            child: Container(
              margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10,bottom: Dimensions.height10),
              child: Row(
                children: [
                  //image Section
                  Container(
                    width:120,
                    height:120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/pizza_1.jpg",
                        )
                      )
                    ),
                  ),
                  //Txt Container
                  Expanded(
                    child: Container(
                      height:Dimensions.listViewTextContentSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          bottomRight:Radius.circular(Dimensions.radius20),
                        ),
                        color: Colors.white
                      ),
                      child:Padding(
                        padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(text: "Neautriuons fruits meal in India"),
                             SizedBox(height: Dimensions.height10,),
                            SmallText(text: "With Butter chease sweet cornio"),
                             SizedBox(height: Dimensions.height10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconAndTextWidget(icon: Icons.circle_sharp,
                                    text: "Normal",
                                    iconColor: Colors.blue),
                                IconAndTextWidget(icon: Icons.location_on,
                                    text: "1.7 km",
                                    iconColor: Colors.blue),
                                IconAndTextWidget(icon: Icons.access_time_rounded,
                                    text: "32min",
                                    iconColor: Colors.blue)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        })
      ],
    );
  }

  Widget _buildItemPage(int index) {
  Matrix4 matrix=new Matrix4.identity();
  if(index==currentPageValue.floor()){
    var currScale=1-(currentPageValue-index)*(1-scaleFactor);
    var currTrans=height*(1-currScale)/2;
    matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
  } else if(index==currentPageValue.floor()+1){
    var currScale=scaleFactor+(currentPageValue-index+1)*(1-scaleFactor);
    var currTrans=height*(1-currScale)/2;
    matrix=Matrix4.diagonal3Values(1, currScale, 1);
    matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
  }else if(index==currentPageValue.floor()-1) {
    var currScale=1-(currentPageValue-index)*(1-scaleFactor);
    var currTrans = height * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1);
    matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
  }else {
    var currScale=0.8;
    matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, height*(1-scaleFactor)/2, 1);

  }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){
              Get.toNamed(RouteHelper.getPopularFood(index));
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin:EdgeInsets.only(left:10,right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  // image: NetworkImage(
                  //   AppConstants.BASE_URL+"/uploads/"+popularProduct.img!
                  // ), Images Can't Be Changed Becuse Data Was Not Found By Api
                  image: AssetImage(
                     "assets/images/pizza_2.jpg",
                  )
                )
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin:EdgeInsets.only(left:Dimensions.width30,right:Dimensions.width30,bottom:Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0,5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5,0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5,0),
                  )
                ]

              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15,right: 15,left: 15),

                child: AppColumn(text: "Badam Pizza",),
                /* Dynamically Data Was Not Change Because Data Was Not Found
                from Api
                child: AppColumn(text: popularProduct.name!),*/
              ),
            ),
          ),
        ],
      ),
    );
  }
}
