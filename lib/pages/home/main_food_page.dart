import 'package:flutter/material.dart';
import 'package:food_delivary_app/pages/home/food_page.dart';
import 'package:food_delivary_app/utils/dimansiontions.dart';
import 'package:food_delivary_app/widgets/big_text.dart';
import 'package:food_delivary_app/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
            Container(
              margin: EdgeInsets.only(top:Dimensions.height45,bottom: Dimensions.height15 ),
              padding: EdgeInsets.only(left:Dimensions.width20,right: Dimensions.width20),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: "India",color: Colors.blue,),
                    Row(
                      children: [
                        SmallText(text: "Bhavnagar",color: Colors.black54,),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    width: 45,
                    height:45 ,
                    child: Icon(Icons.search,color: Colors.white,size: Dimensions.iconSize24,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ) ,),
            Expanded(child: SingleChildScrollView(
              child: FoodPage(),
            ))
          ],
      ),
    );
  }
}
