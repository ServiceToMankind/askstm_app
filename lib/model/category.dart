import 'package:askstm/screens/complaints.dart';
import 'package:flutter/material.dart';

class Category {
  final String name;
  final WidgetBuilder route; // Correctly using WidgetBuilder
  final String image;

  Category(this.name, this.route, this.image);
}

List<Category> categories = categoriesData
    .map((item) => Category(
        item['name'] as String,
        (BuildContext context) => Builder(
              builder: item['route'] as WidgetBuilder,
            ),
        item['image'] as String))
    .toList();

var categoriesData = [
  {
    "name": "Complaints",
    'route': (BuildContext context) =>
        const ComplaintsScreen(), // WidgetBuilder
    'image': "lib/images/complaints.png"
  },
];
