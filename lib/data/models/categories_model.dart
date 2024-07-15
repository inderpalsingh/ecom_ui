class CategoriesModel {
  String id;
  String title;
  String price;
  String description;
  String category;
  String image;

  CategoriesModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory CategoriesModel.fromJSON(Map<String, dynamic> catJSON) {
    return CategoriesModel(
      id: catJSON['id'],
      title: catJSON['title'],
      price: catJSON['price'],
      description: catJSON['description'],
      category: catJSON['category'],
      image: catJSON['image'],
    );
  }
}