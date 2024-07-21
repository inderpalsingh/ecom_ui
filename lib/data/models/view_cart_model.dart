// ignore_for_file: public_member_api_docs, sort_constructors_first
class ViewCartModel {
  int? id;
  int? productId;
  String? name;
  String? price;
  int? quantity;
  String? image;

  ViewCartModel({required this.id, required this.productId, required this.name, required this.price, required this.quantity, required this.image});

  factory ViewCartModel.fromJSON(Map<String, dynamic> viewJson) {
    return ViewCartModel(
      id: viewJson['id'],
      productId: viewJson['product_id'],
      name: viewJson['name'],
      price: viewJson['price'],
      quantity: viewJson['quantity'],
      image: viewJson['image'],
    );
  }
}
