// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class Product {
  late String id;
  String? name;
  String? price;

  Product({
    required this.id,
    this.name,
    this.price,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['productName'];
    price = json['productPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productName'] = this.name;
    data['productPrice'] = this.price;
    return data;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['productName'],
      price: map['productPrice'],
    );
  }
}
