class CartItem {
  String productId;
  String shopId;
  String? size;
  String? shoeSize;
  int quantity;
  int price;

  CartItem(
      {required this.productId,
      this.size,
      required this.shoeSize,
      required this.quantity,
      required this.shopId,
      required this.price});

  int get total => price * quantity;
}
