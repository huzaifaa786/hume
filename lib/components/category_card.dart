import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hume/utils/colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: categoryColor,
      child: SvgPicture.asset('assets/categories/1cloths.svg'),
    );
  }
}