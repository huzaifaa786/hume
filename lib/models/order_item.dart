// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class OrderItem {
  late String id;
  String? productId;
  String? quantity;
  String? size;
  String? total;
  String? shopId;
  String? orderId;

  OrderItem({
    required this.id,
    this.orderId,
    this.productId,
    this.shopId,
    this.quantity,
    this.size,
    this.total,
  });

  OrderItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    quantity = json['quantity'];
    size = json['size'];
    total = json['total'];
    orderId = json['orderId'];
    shopId = json['shopId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productId'] = this.productId;
    data['quantity'] = this.quantity;
    data['size'] = this.size;
    data['total'] = this.total;
    data['orderId'] = this.orderId;
    data['shopId'] = this.shopId;
    return data;
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
        id: map['id'],
        productId: map['productId'],
        quantity: map['quantity'],
        size: map['size'],
        total: map['total'],
        orderId: map['orderId'],
        shopId: map['shopId']);
  }
}
