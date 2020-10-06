import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget filterCategory(String filter) {
  return Container(

      margin: EdgeInsets.all(8.0),
      width: 100.0,
      decoration: BoxDecoration(
        color: Color(0xff875433),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
          child:
          Text(
              filter,
              style:
              TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffedb18b)
              )
          )
      )
  );
}