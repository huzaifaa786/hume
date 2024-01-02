import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hume/models/cart_item.dart';

class CartHelper {
  List<CartItem> cartItems = [];
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  void addProduct(
    String productId,
    String? size,
    int quantity,
    int price,
  ) {
    var index;
    if (size != null) {
      index = cartItems.indexWhere(
          (item) => item.productId == productId && item.size == size);
    } else {
      index = cartItems.indexWhere((item) => item.productId == productId);
    }

    if (index != -1) {
      cartItems[index].quantity += quantity;
    } else {
      cartItems.add(CartItem(
          productId: productId, size: size, quantity: quantity, price: price));
    }
    updateCartInFirestore();
  }

  void loadCartFromFirestore() {
    String userId = auth.currentUser!.uid;
    firestore.collection('carts').doc(userId).get().then((doc) {
      if (doc.exists) {
        var cartData = List.from(doc.data()!['cartItems']);
        cartItems = cartData
            .map((item) => CartItem(
                  productId: item['productId'],
                  size: item['size'] ?? '',
                  quantity: item['quantity'],
                  price: item['price'],
                ))
            .toList();
      }
    });
  }

  void updateQuantity(String productId, String? size, int quantity) {
    // Update product quantity logic
    var index = cartItems
        .indexWhere((item) => item.productId == productId && item.size == size);
    if (index != -1) {
      cartItems[index].quantity = quantity;
      updateCartInFirestore();
    }
  }

  void incrementQuantity(String productId, String? size) {
    int index = cartItems
        .indexWhere((item) => item.productId == productId && item.size == size);
    if (index != -1) {
      cartItems[index].quantity++;
      updateCartInFirestore();
    }
  }

  void decrementQuantity(String productId, String? size) {
    // Decrement product quantity logic
    int index = cartItems
        .indexWhere((item) => item.productId == productId && item.size == size);
    if (index != -1 && cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      updateCartInFirestore();
    }
  }

  void removeProduct(String productId, String? size) {
    // Remove product from cart logic
    cartItems.removeWhere(
        (item) => item.productId == productId && item.size == size);
    updateCartInFirestore();
  }

  void clearCart() {
    cartItems.clear();
    updateCartInFirestore();
    // Clear cart logic
  }

  void updateCartInFirestore() {
    String userId = auth.currentUser!.uid;
    var cartData = cartItems
        .map((item) => {
              'productId': item.productId,
              'size': item.size ?? '',
              'quantity': item.quantity,
              'price': item.price,
            })
        .toList();
    firestore.collection('carts').doc(userId).set({'cartItems': cartData});
  }

  int get totalItemsCount {
    // Calculate total items in cart
    // return cartItems.fold(0, (sum, item) => sum + item.quantity);
    return 1;
  }
}
