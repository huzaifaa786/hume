// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hume/utils/colors.dart';
import 'package:hume/views/account/account_view.dart';
import 'dart:ui' as ui;
import 'package:hume/views/home/home_view.dart';
import 'package:hume/views/search_product.dart/serach_product_view.dart';
import 'package:hume/views/shops/shops_view/shops_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, this.selectedIndex}) : super(key: key);
  final selectedIndex;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with RouteAware {
  int _navigationMenuIndex = 0;
  @override
  Widget build(BuildContext context) {
    var _fragments = [
      const HomeScreen(),
      const SearchProductView(),
      const ShopsView(),
      AccountScreen(),
    ];
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          body: SafeArea(
            child: _fragments[_navigationMenuIndex],
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 35,
            surfaceTintColor: white,
            color: white,
            child: SizedBox(
              height: 30,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      setState(() {
                        _navigationMenuIndex = 0;
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      color: white,
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _navigationMenuIndex = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/Home.svg',
                                fit: BoxFit.scaleDown,
                                height: _navigationMenuIndex == 0 ? 25 : 20,
                                width: 25,
                                color: _navigationMenuIndex == 0
                                    ? mainColor
                                    : Colors.grey,
                              ),
                              const Gap(4),
                              Text(
                                'Home',
                                style: TextStyle(
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w700,
                                  color: _navigationMenuIndex == 0
                                      ? mainColor
                                      : Colors.grey,
                                ),
                              ) ,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _navigationMenuIndex = 1;
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      color: white,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/search.svg',
                              fit: BoxFit.scaleDown,
                              height: _navigationMenuIndex == 1 ? 25 : 20,
                              width: 25,
                              color: _navigationMenuIndex == 1
                                  ? mainColor
                                  : Colors.grey,
                            ),
                            const Gap(4),
                            Text(
                              'Search',
                              style: TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.w700,
                                color: _navigationMenuIndex == 1
                                    ? mainColor
                                    : Colors.grey,
                              ),
                            ) ,
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _navigationMenuIndex = 2;
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      color: white,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _navigationMenuIndex = 2;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/shops.svg',
                                fit: BoxFit.scaleDown,
                                height: _navigationMenuIndex == 2 ? 25 : 20,
                                width: 25,
                                color: _navigationMenuIndex == 2
                                    ? mainColor
                                    : Colors.grey,
                              ),
                              const Gap(4),
                              Text(
                                'Shops',
                                style: TextStyle(
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w700,
                                  color: _navigationMenuIndex == 2
                                      ? mainColor
                                      : Colors.grey,
                                ),
                              ) ,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _navigationMenuIndex = 3;
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      color: white,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _navigationMenuIndex = 3;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/acc.svg',
                                fit: BoxFit.scaleDown,
                                height: _navigationMenuIndex == 3 ? 25 : 20,
                                width: 25,
                                color: _navigationMenuIndex == 3
                                    ? mainColor
                                    : Colors.grey,
                              ),
                              const Gap(4),
                              Text(
                                'Account',
                                style: TextStyle(
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w700,
                                  color: _navigationMenuIndex == 3
                                      ? mainColor
                                      : Colors.grey,
                                ),
                              ) ,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
