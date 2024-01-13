// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_translator/google_translator.dart';
import 'package:hume/utils/colors.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      this.controller,
      this.hint,
      this.text,
      this.color = Colors.white,
      this.obscure = false,
      this.maxlines = false,
      this.enabled = true,
      this.readOnly = false,
      this.onChange,
      this.imageIcon,
      this.validator,
      this.hasTitle = false,
      this.title,
      this.autovalidateMode,
      // this.validate,
      this.icon,
      this.type = TextInputType.text,
      this.fontSize = 14.0,
      this.onpressed})
      : super(key: key);

  final controller;
  final validator;
  // final RxBool? validate;
  final obscure;
  final hint;
  final type;
  final imageIcon;
  final icon;
  final text;
  final autovalidateMode;
  final color;
  final maxlines;
  final onChange;
  final onpressed;
  final fontSize;
  final enabled;
  final readOnly;
  final hasTitle;
  final title;

  @override
  Widget build(BuildContext context) {
    // bool isDark = Provider.of<DarkThemeProvider>(context).darkTheme;

    return Container(
      width: Get.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hasTitle)
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 5),
              child: Text(
                title,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ).translate(),
            ),
          TextFormField(
            readOnly: readOnly,
            enabled: enabled,
            controller: controller,
            style: TextStyle(fontSize: fontSize),
            obscureText: obscure,
            keyboardType: type,
            validator: validator,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.grey.withOpacity(0.1),
            ),
            cursorColor: Colors.black,
            maxLines: maxlines == true ? null : 1,
          ),
        ],
      ),
    );
  }
}
