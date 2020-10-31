import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  final List<String> categories = ['Messages', 'Requests'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildHeading('Messages', 0),
              _buildHeading('Requests', 1),
            ],
          ),
        ),
      ],
    );
  }

  _buildHeading(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 30.0,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selectedIndex == index ? Colors.white : Colors.white60,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}

/*
 Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 30.0,
            ),
            child: Text(
              categories[index],
              style: TextStyle(
                color: index == selectedIndex ? Colors.white : Colors.white60,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
        );
 */
