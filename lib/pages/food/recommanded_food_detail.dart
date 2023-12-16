import 'package:flutter/material.dart';
import 'package:food_delivary_app/pages/home/main_food_page.dart';
import 'package:food_delivary_app/routes/routes_helper.dart';
import 'package:food_delivary_app/utils/dimansiontions.dart';
import 'package:food_delivary_app/widgets/app_icon.dart';
import 'package:food_delivary_app/widgets/big_text.dart';
import 'package:food_delivary_app/widgets/expanable_text_widget.dart';
import 'package:get/get.dart';

class RecommandedFoodDetail extends StatelessWidget {
  const RecommandedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [

            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 70,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (){
                        Get.toNamed(RouteHelper.getInitial());
                      },
                      child: AppIcon(icon: Icons.clear,)),
                  AppIcon(icon: Icons.shopping_cart_checkout_outlined,),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(

                    child: Center(child: BigText(size:Dimensions.font26,text: "Badam Pizza")),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(left: 5,bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20),
                    ),

                  ),
                ),
              ),
              backgroundColor: Colors.blue,
              pinned: true,
              expandedHeight:300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/images/pizza_1.jpg",
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child:Column(
                children: [
                  Container(
                    child: ExpandableTextWidget(
                        text: "pizza, dish of Italian origin consisting of a flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese, and many other ingredients, baked quickly—usually, in a commercial setting, using a wood-fired oven heated to a very high temperature—and served hot."
                        "One of the simplest and most traditional pizzas is the Margherita, which is topped with tomatoes or tomato sauce, mozzarella, and basil. Popular legend relates that it was named for Queen Margherita, wife of Umberto I, who was said to have liked its mild fresh flavour and to have also noted that its topping colours—green, white, and red—were those of the Italian flag."
                        "acaraje. Acaraje is deep fried ground black-eyed peas. Nigerian and Brazilian dish. Sold by street vendors in Brazil's Bahia and Salvador. kara, kosai, sandwich"
                        "The Neapolitan pizza, or Naples-style pizza, is made specifically with buffalo mozzarella (produced from the milk of Italian Mediterranean buffalo) or fior"" di latte (mozzarella produced from the milk of prized Agerolese cows) and with San Marzano tomatoes or pomodorino vesuviano (a variety of grape tomato grown in Naples). "
                            "Roman pizza often omits tomatoes (an early 16th-century import) and uses onions and olives. "
                            "The Ligurian pizza resembles the pissaladière of Provence in France, adding anchovies to olives and onions. "
                            "Pizza has also spread from Italy throughout much of the rest of the world, and, in regions outside of Italy, "
                            "the toppings used vary with the ingredients available and the flavour profile preferred."
                        "The popularity of pizza in the United States began with the Italian community in New York City, where the Neapolitan pizza had an early influence."
                            " The first pizzeria appeared in New York City about the turn of the 20th century. After World War II the pizza industry boomed. "
                            "Soon there was scarcely a hamlet without a pizzeria. Sausage, bacon, ground beef, pepperoni, mushrooms, and peppers are traditional toppings familiar to many Americans, "
                            "but ingredients as varied as arugula, pancetta, and truffles have found their way onto pizzas there. Variations are also often tied to different regions in the country, "
                            "Chicago’s deep-dish pizza and California-style pizza among them."


                    ),
                    margin: EdgeInsets.only(right: Dimensions.width20,left: Dimensions.width20),
                  ),
                ],
              ),
            )

          ],
        ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20*2.5,
              right: Dimensions.width20*2.5,
              top:Dimensions.height10,
              bottom:Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.remove),
                BigText(text: "\$12.88 "+" X "+" 0 ",size: Dimensions.font26,),
                AppIcon(icon: Icons.add),

              ],
            ),
          ),
          Container(
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
                  child: Icon(
                    Icons.favorite,
                    color: Colors.blue,
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
        ],
      ),
    );
  }
}
