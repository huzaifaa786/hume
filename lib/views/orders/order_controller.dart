// ignore_for_file: avoid_print, prefer_const_declarations

import 'package:get/get.dart';
import 'package:hume/api/order_api.dart';
import 'package:hume/helper/loading.dart';
import 'package:hume/models/order.dart';
import 'package:hume/utils/translation.dart';
import 'package:intl/intl.dart';

class OrdersController extends GetxController {
  static OrdersController instance = Get.find();

  final _orderApi = OrderApi();
  final String? userId = Get.parameters['userId'];
  List<UserOrder> fetchedAllOrders = [];
  List<Map<String, dynamic>> allOrders = [];
  List<Map<String, dynamic>> acceptedOrders = [];
  List<Map<String, dynamic>> deliveredOrders = [];
  List<Map<String, dynamic>> rejectedOrders = [];
  List<Map<String, dynamic>> inprogressOrders = [];
  int tabIndex = 0;
  String? all;
  String? accepted;
  String? rejected;
  String? completed;

  void setIndex(index) {
    tabIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchAllOrders();
    update();
  }

  fetchAllOrders() async {
    LoadingHelper.show();
    fetchedAllOrders = await _orderApi.fetchAllOrders(userId.toString());
    for (var order in fetchedAllOrders) {
      int millisecondsSinceEpoch = int.parse(order.id);
      int secondsSinceEpoch = millisecondsSinceEpoch ~/ 1000;
      DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(secondsSinceEpoch * 1000);
      String date = DateFormat("dd/MM/yyyy").format(dateTime);

      final orderdetail = {
        'id': order.id,
        'total': order.total,
        'status': order.status,
        'date': date
      };
      allOrders.add(orderdetail);
      order.status == '0'
          ? inprogressOrders.add(orderdetail)
          : order.status == '1'
              ? acceptedOrders.add(orderdetail)
              : order.status == '2'
                  ? rejectedOrders.add(orderdetail)
                  : deliveredOrders.add(orderdetail);
    }
    update();
    LoadingHelper.dismiss();
  }
}
