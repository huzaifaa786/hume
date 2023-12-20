import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hume/utils/colors.dart';

class OutlineButton extends StatelessWidget {
  const OutlineButton({
    Key? key,
    @required this.title,
    @required this.onPressed,
    this.text,
    this.textcolor = white,
    this.icon,
    this.sreenRatio = 1,
  }) : super(key: key);

  final title;
  final onPressed;
  final sreenRatio;
  final text;
  final textcolor;
  final icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
          width: MediaQuery.of(context).size.width * sreenRatio,
          height: 53,
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFF8535B6)),
                borderRadius: BorderRadius.circular(88),
              ),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                icon,
                color: iconColor,
              ),
              Gap(10),
              Text(
                title,
                style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              )
            ]),
          )),
    );
  }
}
