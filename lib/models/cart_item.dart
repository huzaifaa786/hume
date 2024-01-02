class CartItem {
  String productId;
  String? size;
  int quantity;
  int price;

  CartItem(
      {required this.productId,
      this.size,
      required this.quantity,
      required this.price});

  int get total => price * quantity;
}
