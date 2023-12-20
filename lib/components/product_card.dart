// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hume/utils/colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right : 10,left: 10, top: 15, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image(
                image: AssetImage('assets/images/product.jpg'),
                width: 175,
              ),
          ),
          Gap(5),
          Padding(
            padding: const EdgeInsets.only(left : 8.0),
            child: Column(children: [
                        Text('Green chair',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                Text('250 AED',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: mainColor)),
            ],),
          ),
        ],
      ),
    );
  }
}
