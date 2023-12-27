// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class Shop {
  late String id;
  String? name;

  Shop(
      {
      required this.id,
      this.name,

     });

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
   
    return data;
  }

  factory Shop.fromMap(Map<String, dynamic> map) {
    return Shop(
      id: map['id'],
      name: map['name'],
     
    );
  }
}
