// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class AppUser {
  late String id;
  String? name;
  String? email;
  String? phone;
  AppUser(
      {
      required this.id,
      this.name,
      this.email,
      this.phone,
     });

  AppUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
    );
  }
}
