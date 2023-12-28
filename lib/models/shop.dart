// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class Shop {
  late String id;
  String? name;
  String? description;
  String? logoImageUrl;
  String? bannerImageUrl;
  String? category;

  Shop({
    required this.id,
    this.name,
    this.description,
    this.logoImageUrl,
    this.bannerImageUrl,
    this.category,
  });

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    logoImageUrl = json['logoImageUrl'];
    bannerImageUrl = json['bannerImageUrl'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['logoImageUrl'] = this.logoImageUrl;
    data['bannerImageUrl'] = this.bannerImageUrl;
    data['category'] = this.category;

    return data;
  }

  factory Shop.fromMap(Map<String, dynamic> map) {
    return Shop(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      logoImageUrl: map['logoImageUrl'],
      bannerImageUrl: map['bannerImageUrl'],
      category: map['category'],
    );
  }
}
