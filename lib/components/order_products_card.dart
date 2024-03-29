// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_typing_uninitialized_variables, unnecessary_new

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume/utils/colors.dart';

class OrderProductsCard extends StatelessWidget {
  const OrderProductsCard(
      {super.key, this.name, this.size, this.quantity, this.price, this.image});
  final name;
  final image;
  final size;
  final quantity;
  final price;

  @override
  Widget build(BuildContext context) {
    print('object $size');
    return Column(
      children: [
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [image],
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  size != ''
                      ? Row(
                          children: [
                            Text(
                              'Size : '.tr + ' : ',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                            Text(
                              size.toString(),
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                          ],
                        )
                      : SizedBox(height: 20),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        'Quantity : '.tr + ' : ',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                      Text(
                        quantity,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: colortext),
                      ),
                      Text(
                        '  AED'.tr,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: colortext),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 23,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 3,
        ),
        new Divider(
          color: Color.fromARGB(255, 221, 208, 207),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
