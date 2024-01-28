import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hume/models/cart_item.dart';
import 'package:hume/utils/ui_utils.dart';

class CartHelper {
  List<CartItem> cartItems = [];
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

   addProduct(
    String productId,
    String shopId,
    String? size,
    int quantity,
    int price,
  ) async {
    await loadCartFromFirestore();
    print(shopId);
    if (cartItems.isNotEmpty &&
        cartItems.where((item) => item.shopId == shopId).isEmpty) {
      print('dddddddddddddddddddddddd');
      UiUtilites.errorSnackbar(
          'One shop allowed', 'only one shop items can be added to the cart');
      return false;
    }

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
          productId: productId,
          size: size,
          quantity: quantity,
          price: price,
          shopId: shopId));
    }
    updateCartInFirestore();
    return true;
  }

  Future<List<CartItem>> loadCartFromFirestore() async {
    String userId = auth.currentUser!.uid;
    await firestore.collection('carts').doc(userId).get().then((doc) {
      if (doc.exists) {
        var cartData = List.from(doc.data()!['cartItems']);
        cartItems = cartData
            .map((item) => CartItem(
                  productId: item['productId'],
                  size: item['size'] ?? '',
                  quantity: item['quantity'],
                  price: item['price'],
                  shopId: item['shopId'],
                ))
            .toList();
      }
    });
    return cartItems;
  }

  Stream<List<CartItem>> loadCartStreamFromFirestore() {
  String userId = auth.currentUser!.uid;
  return firestore.collection('carts').doc(userId).snapshots().map((snapshot) {
    if (snapshot.exists) {
      var cartData = List.from(snapshot.data()!['cartItems']);
      List<CartItem> cartItems = cartData.map((item) => CartItem(
        productId: item['productId'],
        size: item['size'] ?? '',
        quantity: item['quantity'],
        price: item['price'],
        shopId: item['shopId'],
      )).toList();

      return cartItems;
    } else {
      return [];
    }
  });
}

  Future<List<CartItem>> updateQuantity(
      String productId, String? size, int quantity) async {
    await loadCartFromFirestore();
    var index;
    if (size != null) {
      index = cartItems.indexWhere(
          (item) => item.productId == productId && item.size == size);
    } else {
      index = cartItems.indexWhere((item) => item.productId == productId);
    }
    if (index != -1) {
      cartItems[index].quantity = quantity;
      updateCartInFirestore();
    }

    return cartItems;
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

  Future<List<CartItem>> removeProduct(String productId, String? size) async {
    await loadCartFromFirestore();
    var index;
    if (size != null) {
      cartItems.removeWhere(
          (item) => item.productId == productId && item.size == size);
    } else {
      cartItems.removeWhere((item) => item.productId == productId);
    }
    updateCartInFirestore();

    return cartItems;
  }

  void clearCart() async {
    await loadCartFromFirestore();
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
              'shopId': item.shopId,
            })
        .toList();
    firestore.collection('carts').doc(userId).set({'cartItems': cartData});
  }

  int get totalItemsCount {
    // Calculate total items in cart
    return cartItems.fold(0, (sum, item) => sum + item.quantity);
  }

  int get totalAmount {
    return cartItems.fold(0, (sum, item) => sum + item.total);
  }
}
