class ProductModel {
  bool? status;
  String? message;
  List<Products>? data;

  ProductModel({required this.status, required this.message,  required this.data});

  factory ProductModel.fromJson(Map<String, dynamic> prodJson) {
    List<Products> allProducts = [];

    for (Map<String, dynamic> eachProduct in prodJson['data']) {
      Products products = Products.fromJson(eachProduct);
      allProducts.add(products);
    }
    return ProductModel(
      status: prodJson['status'],
      message: prodJson['message'],
      data: allProducts,
    );
  }
}

class Products {
  String? id;
  String? category_id;
  String? created_at;
  String? image;
  String? name;
  String? price;
  String? status;
  String? updated_at;

  Products({
    required this.id,
    required this.category_id,
    required this.created_at,
    required this.image,
    required this.name,
    required this.price,
    required this.status,
    required this.updated_at,

  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category_id = json['category_id'];
    created_at = json['created_at'];
    image = json['image'];
    name = json['name'];
    price = json['price'];
    status = json['status'];
    updated_at = json['updated_at'];

  }

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['category_id'] = category_id;
    data['created_at'] = created_at;
    data['image'] = image;
    data['name'] = name;
    data['price'] = price;
    data['status'] = status;
    data['updated_at'] = updated_at;
    return data;
  }
}






// class ProductModel {
//   int? total;
//   int? skip;
//   int? limit;
//   List<Products>? products;

//   ProductModel({required this.products, required this.total, required this.skip, required this.limit});

//   factory ProductModel.fromJson(Map<String, dynamic> prodJson) {
//     List<Products> allProducts = [];

//     for (Map<String, dynamic> eachProduct in prodJson['products']) {
//       Products products = Products.fromJson(eachProduct);
//       allProducts.add(products);
//     }
//     return ProductModel(
//       total: prodJson['total'],
//       skip: prodJson['skip'],
//       limit: prodJson['limit'],
//       products: allProducts,
//     );
//   }
// }

// class Products {
//   int? id;
//   String? title;
//   String? description;
//   String? category;
//   double? price;
//   double? rating;
//   int? stock;
//   List<dynamic>? images;
//   String? thumbnail;

//   Products({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.category,
//     required this.price,
//     required this.rating,
//     required this.stock,
//     required this.images,
//     required this.thumbnail,
//   });

//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     description = json['description'];
//     category = json['category'];
//     price = json['price'];
//     rating = json['rating'];
//     stock = json['stock'];
//     images = json['images'];
//     thumbnail = json['thumbnail'];
//   }

//   Map<String, dynamic> toJson() {

//     final Map<String, dynamic> data = {};
//     data['id'] = id;
//     data['title'] = title;
//     data['description'] = description;
//     data['category'] = category;
//     data['price'] = price;
//     data['rating'] = rating;
//     data['stock'] = stock;
//     data['images'] = images;
//     data['thumbnail'] = thumbnail;
//     return data;
//   }
// }
