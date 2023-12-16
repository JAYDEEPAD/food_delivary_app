import 'package:food_delivary_app/data/repository/popular_product_repo.dart';
import 'package:food_delivary_app/models/product_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
    final PopularProductRepo popularProductRepo;

    PopularProductController({required this.popularProductRepo});

    List<dynamic> _PopularProductList=[];
    List<dynamic> get popularProductList=>_PopularProductList;

    bool _isLoaded=false;
    bool get isLoaded=>_isLoaded;

    Future<void> getPopularProductList() async{
       Response response= await popularProductRepo.getPopularProductList();
       if(response.statusCode==200){
         print("got Products");
           _PopularProductList=[];
           _PopularProductList.addAll(Product.fromJson(response.body).products);
           print(_PopularProductList);
           _isLoaded=true;
           update();
       }

       else{
         print("Could Not Get products Recommended");
         print("Above Api is Not Called");

       }
}
}