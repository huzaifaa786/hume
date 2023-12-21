// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:hume/components/button.dart';
import 'package:hume/components/button_fwd_arrow.dart';
import 'package:hume/utils/colors.dart';
import 'package:hume/views/layout/layout_screen.dart';
import 'package:hume/views/shops/shops_view/shops_controller.dart';

class ShopsView extends GetView<ShopsController> {
  const ShopsView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
        appBarTitle: 'Hume Shops',
        body: ListView.builder(
          itemCount: 6, // Creating 6 identical cards
          itemBuilder: (context, index) {
            return Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                decoration: BoxDecoration(
                  color: containerBg,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(
                    'Trendy Fashion',
                    style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: appbarText),
                  ),
                  subtitle: Text(
                    'Clothes brand',
                    style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                  onTap: () {
                    // Add functionality here if needed
                  },
                  // trailing:
                ));
          },
        ));
  }
}
