import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(title: 'Demo Productbox'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) :super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Product"),),
      body: ListView(
        shrinkWrap: true, padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: <Widget>[
          ProductBox(
              name: "iPhone",
              description: "iPhone is the stylist phone ever",
              price: 1000 ,
              image: "iphone.jpg",
          ),
          ProductBox(
            name: "Pixel",
            description: "Pixel is the most featureful phone ever",
            price: 850 ,
            image: "pixel1.jpg",
          ),
          ProductBox(
            name: "Laptop",
            description: "laptop is the most productive development tool",
            price: 2000 ,
            image: "laptop.jpg",
          ),
          ProductBox(
            name: "Tablet",
            description: "Tablet is the most useful device ever for meeting",
            price: 1500 ,
            image: "tablet.jpg",
          ),
          ProductBox(
            name: "Pendrive",
            description: "Pendrive is useful storage medium",
            price: 100 ,
            image: "pendriver.jpg",
          ),
          ProductBox(
            name: "Floppy Drive",
            description: "Floppy drive is useful rescue storage medium",
            price: 20 ,
            image: "floppydisk.jpg",
          ),
        ],
      ),
    );
  }
}

class RatingBox extends StatefulWidget {
  @override
  _StateRatingBox createState() => _StateRatingBox();
}

class _StateRatingBox extends State<RatingBox> {
  int _r = 0;
  void _setRating_1() {
    setState(() {
      _r = 1;
    });
  }
  void _setRating_2() {
    setState(() {
      _r = 2;
    });
  }
  void _setRating_3() {
    setState(() {
      _r = 3;
    });
  }
  Widget build(BuildContext context) {
    double _size = 25;
    print(_r);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_r >=1 ? Icon(Icons.star, size: _size) :
            Icon(Icons.star_border,size: _size)
            ),
            color: Colors.red,
            onPressed: _setRating_1,
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_r >=2 ? Icon(Icons.star, size: _size) :
            Icon(Icons.star_border,size: _size)
            ),
            color: Colors.red,
            onPressed: _setRating_2,
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_r >=3 ? Icon(Icons.star, size: _size) :
            Icon(Icons.star_border,size: _size)
            ),
            color: Colors.red,
            onPressed: _setRating_3,
            iconSize: _size,
          ),
        ),
      ],
    );
  }
}

class ProductBox extends StatelessWidget {
  const ProductBox({Key? key, required this.name, required this.description, required this.price, required this.image}) :super(key: key);
  final String name;
  final String description;
  final int price;
  final String image;

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2), height: 150, child: Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
          Image.asset("assets/"+ image), Expanded(child: Container(
          padding: EdgeInsets.all(5), child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(this.name, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(this.description),
            Text("Price: " + this.price.toString()),
            RatingBox(),
          ],
        ),
        ))
      ],
      )
    )
    );
  }
}