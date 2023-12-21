// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume/utils/colors.dart';

class LayoutScaffold extends StatefulWidget {
  final Widget body;
  final Widget? bottomNav;
  final String appBarTitle;
   bool hasBottomNav;
  LayoutScaffold({required this.body, required this.appBarTitle, this.hasBottomNav = false, this.bottomNav});

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
          children: [
          Icon(
            Icons.arrow_back_ios_new_rounded,
            color: mainColor,
            size: 26,
          ),
          Text(widget.appBarTitle,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: appbarText),),
          Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.transparent,
            size: 26,
          ),
        ]),
      ),
      bottomNavigationBar: widget.hasBottomNav ? widget.bottomNav : Container(),
      body: widget.body,
    );
  }
}
