import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:thiss/Mydrawer.dart';
import 'package:thiss/pdfpage.dart';
import 'package:thiss/Loksewa.dart';

// import 'package:thiss/Newsdata.dart';

class CarouselPage extends StatefulWidget {
  // const CarouselPage({Key key}) : super(key: key);

  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cobra Guys"),
        ),
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Carousel(
                  animationCurve: Curves.easeInExpo,
                  boxFit: BoxFit.cover,
                  dotColor: Colors.red,
                  images: [
                    ExactAssetImage('assets/im1.jpg'),
                    ExactAssetImage('assets/im2.jpg'),
                    ExactAssetImage('assets/im3.jpg'),
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  "Featured Posts",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
              Container(
                // margin: EdgeInsets.symmetric(vertical: 10.0),
                height: 225.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "PineApple",
                            style: TextStyle(
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black,
                                    offset: Offset(5.0, 5.0),
                                  ),
                                ],
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/PineApple.jpg"),
                                fit: BoxFit.cover),
                          ),
                          width: 160.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Kiwi Kheti",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/kiwi.jpg"),
                                fit: BoxFit.cover),
                          ),
                          width: 160.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PdfPage('Papaya')));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Papaya",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/papaya.jpeg"),
                                  fit: BoxFit.cover),
                            ),
                            width: 160.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PdfPage('Pine Apple')));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Pine Apple",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/PineApple.jpg"),
                                  fit: BoxFit.cover),
                            ),
                            width: 160.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.book_online_rounded,
                  color: Colors.green,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Loksewa()));
                },
                title: Text(
                  "Loksewa Model Questions",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
