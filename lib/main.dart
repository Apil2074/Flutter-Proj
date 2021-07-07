import 'package:flutter/material.dart';
import 'package:thiss/Carousel_page.dart';
import 'package:thiss/Coverterpage.dart';
import 'package:thiss/Devpage.dart';
import 'package:thiss/Mydrawer.dart';
import 'package:thiss/Nepse_page.dart';
import 'package:thiss/Newsdata.dart';
import 'package:thiss/Vege.dart';
import 'package:thiss/Weather_update.dart';
import 'package:thiss/about_us.dart';
import 'package:thiss/covid_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Land Unit Converter',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Today Market Price (Kalimati)',
          ),
        ),
        body: CarouselPage(),
        drawer: MyDrawer(),
      ),
      initialRoute: '/',
      routes: {
        '/second': (context) => WeatherPage(),
        '/third': (context) => HomePage(),
        '/forth': (context) => Converter(),
        '/fifth': (context) => NewsPage(),
        '/covid': (context) => CovidPage(),
        '/sharebazar': (context) => NepsePage(),
        '/aboutus': (context) => AboutUs(),
        '/devops': (context) => DevPage(),
      },
    );
  }
}
