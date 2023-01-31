class ProductModel {
  String id;
final  String imgUrl;
final  String name;
final String detailsItem;
final  String price;
final  String discountValue;
final  String category;

  ProductModel({
     this.id = '',
    required this.imgUrl,
    required this.name,
    required this.detailsItem,
    required this.price,
    required this.discountValue,
    required this.category,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map,String documentId) {
    return ProductModel(
      id: documentId,
      // map['id'],
      imgUrl: map['imgUrl'],
      name: map['name'],
      detailsItem: map['detailsItem'],
      price: map['price'],
      discountValue: map['discountValue'],
      category: map['category'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': id,
      'imgUrl': imgUrl,
      'name': name,
      'detailsItem': detailsItem,
      'price': price,
      'discountValue': discountValue,
      'category': category,
    };
  }
}
