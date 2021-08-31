import 'package:flutter/material.dart';
import 'package:thiss/ReaderScreen.dart';

class AgPage extends StatelessWidget {
  const AgPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("More on Agriculture"),
      ),
      body: DetailPage(),
    );
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({Key key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var listss = [
    'Cucumber',
    'Carrot',
    'Mango',
    'Litchi',
    'Pomegenerate',
    'Dragon Fruit',
    'JackFruit',
    'PineApple',
  ];
  var imglist = [
    'assets/cucumber.jpg',
    'assets/carrot.jpg',
    'assets/Mango.jpg',
    'assets/Litchi.jpg',
    'assets/Pomegenerate.png',
    'assets/DragonFruit.jpg',
    'assets/JackFruit.jpg',
    'assets/PineApple.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: listss.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                if (listss[index] == 'Cucumber') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReaderScreen('Cucumber')));
                } else if (listss[index] == 'Carrot') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReaderScreen('Carrot')));
                } else if (listss[index] == 'Mango') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReaderScreen('Mango')));
                } else if (listss[index] == 'Litchi') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReaderScreen('Litchi')));
                } else if (listss[index] == 'Pomegenerate') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReaderScreen('Pomegenerate')));
                } else if (listss[index] == 'JackFruit') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReaderScreen('JackFruit')));
                } else if (listss[index] == 'PineApple') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReaderScreen('PineApple')));
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imglist[index]), fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      listss[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 33,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(1.0, 2.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          Shadow(
                            offset: Offset(1.0, 3.0),
                            blurRadius: 1.0,
                            color: Color.fromARGB(125, 0, 0, 255),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
