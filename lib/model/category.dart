import 'package:askstm/screens/complaints.dart';
import 'package:askstm/screens/home.dart';

class Category {
  final String name;
  final String image;
  final dynamic route;

  Category(this.name, this.image, this.route);
}

List<Category> categories = categoriesData
    .map((item) => Category(
          item['name'] as String,
          item['image'] as String,
          item['route'],
        ))
    .toList();

var categoriesData = [
  {
    "name": "Complaint Box",
    'image': "assets/images/law.png",
    'route': const ComplaintsScreen()
  },
  {
    "name": "Blood Requests",
    'image': "assets/images/blood.png",
    'route': const HomeScreen()
  },
  {
    "name": "Other Requests",
    'image': "assets/images/others.png",
    'route': const ComplaintsScreen()
  },
];
