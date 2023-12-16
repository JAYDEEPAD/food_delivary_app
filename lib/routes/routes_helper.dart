import 'package:food_delivary_app/pages/food/popular_food_detail.dart';
import 'package:food_delivary_app/pages/food/recommanded_food_detail.dart';
import 'package:food_delivary_app/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper{

  static const String  initial="/";
  static const String  popularFood="/popular-food";
  static const String  recommandedFood="/recommanded-food";


  static  String  getPopularFood( int pageId)=>"$popularFood?pageId=$pageId";
  static  String  getRecommandedFood()=>"$recommandedFood";
  static  String  getInitial()=>"$initial";

  static List<GetPage> routes=[
    GetPage(name: initial, page: ()=>MainFoodPage()),


    GetPage(name: popularFood, page:() {
      var pageId=Get.parameters['pageId'];
      //return PopularFoodDetail(pageId: int.parse(pageId!));
      return PopularFoodDetail();
    },
      transition: Transition.fadeIn
    ),
    GetPage(name: recommandedFood, page:() {
      return RecommandedFoodDetail();
    },
        transition: Transition.fadeIn
    ),
  ];
}