// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class Product {
  late String id;
  String? name;
  String? price;
  List? images;
  List? sizes;
  List? shoseselectedSizes;
  String? shopId;
  String? description;
  String? category;

  Product(
      {required this.id,
      required this.shoseselectedSizes,
      this.name,
      this.price,
      this.images,
      this.sizes,
      this.shopId,
      this.description,
      this.category});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['productName'];
    price = json['productPrice'];
    images = json['productImageUrls'];
    sizes = json['selectedSizes'];
    shopId = json['shopId'];
    description = json['productDescription'];
    category = json['category'];
    shoseselectedSizes = json['shoseselectedSizes'] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productName'] = this.name;
    data['productPrice'] = this.price;
    data['productImageUrls'] = this.images;
    data['selectedSizes'] = this.sizes;
    data['shopId'] = this.shopId;
    data['productDescription'] = this.description;
    data['category'] = this.category;
    data['shoseselectedSizes'] = this.shoseselectedSizes;
    return data;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['productName'],
      price: map['productPrice'],
      images: map['productImageUrls'],
      sizes: map['selectedSizes'] ?? [],
      shoseselectedSizes: map['shoseselectedSizes'] ?? [],
      shopId: map['shopId'],
      description: map['productDescription'],
      category: map['category'],
    );
  }
}
