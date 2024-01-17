// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume/api/auth_api.dart';
import 'package:hume/utils/colors.dart';

class LayoutScaffold extends StatefulWidget {
  final _authApi = AuthApi();
  final Widget body;
  final Widget? bottomNav;
  final String appBarTitle;
  final ontap;
  bool hasBottomNav;
  bool hasLogout;
  LayoutScaffold(
      {required this.body,
      required this.appBarTitle,
      this.hasBottomNav = false,
      this.bottomNav,
      this.hasLogout = false,
      this.ontap});

  @override
  State<LayoutScaffold> createState() => _LayoutScaffoldState();
}

class _LayoutScaffoldState extends State<LayoutScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          widget.hasBottomNav == false
              ? InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: mainColor,
                    size: 26,
                  ),
                )
              : Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.transparent,
                  size: 26,
                ),
          Text(
            widget.appBarTitle,
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w500, color: appbarText),
          ),
          widget.hasLogout
              ? InkWell(
                  onTap: widget.ontap,
                  child: Icon(
                    Icons.logout_outlined,
                    color: Colors.red,
                    size: 26,
                  ),
                )
              : Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.transparent,
                  size: 26,
                ),
        ]),
      ),
      bottomNavigationBar: widget.hasBottomNav || widget.bottomNav != null
          ? widget.bottomNav
          : SizedBox(),
      body: widget.body,
    );
  }
}
