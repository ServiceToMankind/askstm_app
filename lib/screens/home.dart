import 'package:askstm/constants.dart';
// import 'package:askstm/details_screen.dart';
import 'package:askstm/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AskSTM',
      theme: ThemeData(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // SvgPicture.asset("assets/icons/menu.svg"),
                Image.asset("assets/images/logo.png", height: 35),
                Image.asset("assets/images/logo.png", height: 35),
              ],
            ),
            const SizedBox(height: 30),
            const Text("Welcome,", style: kHeadingextStyle),
            const Text("#AskSTM for all your needs",
                style: kSubheadingextStyle),
            // Container(
            //   margin: const EdgeInsets.symmetric(vertical: 30),
            //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            //   height: 60,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     color: const Color(0xFFF5F5F7),
            //     borderRadius: BorderRadius.circular(40),
            //   ),
            //   child: Row(
            //     children: <Widget>[
            //       SvgPicture.asset("assets/icons/search.svg"),
            //       const SizedBox(width: 16),
            //       const Text(
            //         "Search for anything",
            //         style: TextStyle(
            //           fontSize: 18,
            //           color: Color(0xFFA0A5BD),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Services", style: kTitleTextStyle),
                // Text(
                //   "See All",
                //   style: kSubtitleTextSyule.copyWith(color: kBlueColor),
                // ),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: StaggeredGridView.countBuilder(
                padding: const EdgeInsets.all(0),
                crossAxisCount: 2,
                itemCount: categories.length,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Builder(
                            builder: (BuildContext context) =>
                                categories[index].route(context),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      height: index.isEven ? 200 : 240,
                      // constraints: const BoxConstraints(maxWidth: 150),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(categories[index].image),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            categories[index].name,
                            style: kTitleTextStyle,
                          ),
                          // Text(
                          //   '${categories[index].numOfCourses} Courses',
                          //   style: TextStyle(
                          //     color: kTextColor.withOpacity(.5),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
