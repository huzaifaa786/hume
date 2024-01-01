// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume/utils/colors.dart';

class SearchInputField extends StatelessWidget {
  const SearchInputField(
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

  @override
  Widget build(BuildContext context) {
    // bool isDark = Provider.of<DarkThemeProvider>(context).darkTheme;

    return SizedBox(
      width: Get.width * 0.9,
      child: TextFormField(
        readOnly: readOnly,
        enabled: enabled,
        onChanged: onChange,
        onTap: onpressed,
        controller: controller,
        style: TextStyle(fontSize: fontSize),
        obscureText: obscure,
        keyboardType: type,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon:  const Icon(
            Icons.search,
              color: Colors.grey,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
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
    );
  }
}
