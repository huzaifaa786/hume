import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hume/utils/colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.25,
      color: categoryColor,
      child: 
      // Image(image: AssetImage('assets/categories/cloths.png'))
      SvgPicture.asset('assets/categories/devices.svg',height: 200,),
    );
  }
}