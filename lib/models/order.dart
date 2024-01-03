// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class UserOrder {
  late String id;
  String? name;
  String? phone;
  String? address;
  String? total;
  String? userId;
  String? status;
  String? paymentIntent;

  UserOrder({
    required this.id,
    this.name,
    this.phone,
    this.address,
    this.total,
    this.userId,
    this.status,
    this.paymentIntent,
  });

  UserOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    total = json['total'];
    userId = json['userId'];
    status = json['status'];
    paymentIntent = json['paymentIntent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['total'] = this.total;
    data['userId'] = this.userId;
    data['status'] = this.status;
    data['paymentIntent'] = this.paymentIntent;

    return data;
  }

  factory UserOrder.fromMap(Map<String, dynamic> map) {
    return UserOrder(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      address: map['address'],
      total: map['total'],
      userId: map['userId'],
      status: map['status'],
      paymentIntent: map['paymentIntent'],
    );
  }
}
