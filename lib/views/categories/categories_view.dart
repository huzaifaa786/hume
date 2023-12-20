import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hume/components/category_card.dart';
import 'package:hume/views/layout/layout_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
      appBarTitle: 'Categories',
      body: SafeArea(child: 
      Column(children: [
        Row(
          children : [
           CategoryCard()
          ]
        ),
         Row(
          children : [

          ]
        )
      ],)
      )
    );
  }
}