class ProductModel {
  int? total;
  int? skip;
  int? limit;
  List<Products>? products;

  ProductModel({required this.products, required this.total, required this.skip, required this.limit});

  factory ProductModel.fromJson(Map<String, dynamic> prodJson) {
    List<Products> allProducts = [];

    for (Map<String, dynamic> eachProduct in prodJson['products']) {
      Products products = Products.fromJson(eachProduct);
      allProducts.add(products);
    }
    return ProductModel(
      total: prodJson['total'],
      skip: prodJson['skip'],
      limit: prodJson['limit'],
      products: allProducts,
    );
  }
}

class Products {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? rating;
  int? stock;
  List<String>? images;
  String? thumbnail;

  Products({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.rating,
    required this.stock,
    required this.images,
    required this.thumbnail,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    price = json['price'];
    rating = json['rating'];
    stock = json['stock'];
    images = json['images'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['category'] = category;
    data['price'] = price;
    data['rating'] = rating;
    data['stock'] = stock;
    data['images'] = images;
    data['thumbnail'] = thumbnail;
    return data;
  }
}
