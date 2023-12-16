class Product{
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List <ProductModel> _products;
  List <ProductModel> get products=>_products;

  Product({ required products,required totalSize,required offset,required typeId}){
    this._totalSize=totalSize;
    this._typeId=typeId;
    this._offset=offset;
    this._products=products;
  }

  Product.fromJson(Map<String,dynamic> json){
    _totalSize=json['total_size'];
    _typeId=json['type_id'];
    _offset=json['offset'];
    if(json['products']!=null){
      _products=<ProductModel>[];
      json['products'].foreach((v){
        _products.add(ProductModel.fromJson(v));
      });
    }
  }
}

class ProductModel{
  int ? id;
  String ? name;
  String ? description;
  int ? price;
  int ? stars;
  String ? img;
  String ? location;
  String ? createdAt;
  String ? updatedAt;
  int ? typeId;

  ProductModel({
    this.id,
    this.typeId,
    this.name,
    this.createdAt,
    this.description,
    this.img,
    this.location,
    this.price,
    this.stars,
    this.updatedAt
  });


  ProductModel.fromJson(Map<String, dynamic> json) {
     id=json['id'];
     name=json['name'];
     description=json['description'];
     price=json['price'];
     stars=json['stars'];
     img=json['img'];
     location=json['location'];
     createdAt=json['created_at'];
     updatedAt=json['updated_at'];
     typeId=json['type_id'];
   }


}