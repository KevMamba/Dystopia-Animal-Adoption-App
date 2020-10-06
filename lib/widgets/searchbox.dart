import 'package:flutter/material.dart';


Padding buildSearchBox() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40.0),
    child: Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        child: RaisedButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.search),
              Text(
                "Search for a pet...",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Opacity(
                opacity: 0.0,
              )
            ],
          ),
        ),
      ),
    ),
  );
}