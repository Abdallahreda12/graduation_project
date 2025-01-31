import 'package:flutter/material.dart';
import 'package:graduation_project/view/home%20page/widgets/NavigatorsTapInHomePage.dart';
import 'package:graduation_project/view/home%20page/widgets/headerSectionInHomePage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, right: 25, left: 25, bottom: 0),
        child: Column(
          children: [
            //
            //HeaderSection for HomePage
            //
            HeaderSectionInHomePage(),
            SizedBox(
              height: 15,
            ),
            //
            //Navigator Taps in Home Page
            //
            NavigatorsTapsInHomePage(),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
