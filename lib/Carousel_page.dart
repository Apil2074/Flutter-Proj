import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({Key key}) : super(key: key);

  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: Carousel(
            animationCurve: Curves.easeIn,
            boxFit: BoxFit.cover,
            dotColor: Colors.red,
            images: [
              ExactAssetImage('assets/im1.jpg'),
              ExactAssetImage('assets/im2.jpg'),
              ExactAssetImage('assets/im3.jpg'),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: ListTile(
            leading: Icon(
              Icons.ac_unit_outlined,
              color: Colors.red,
            ),
            trailing: Icon(
              Icons.info,
              color: Colors.red,
            ),
            title: Text(
              "Hello Amit Jhan Welcome to my Channel",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text('Welcome to my Website'),
            ),
          ),
        )
      ],
    );
  }
}
