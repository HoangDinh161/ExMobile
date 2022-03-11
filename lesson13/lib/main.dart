import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    controller.forward();
    return MaterialApp(
        title: 'Flutter Demo', theme: ThemeData(primarySwatch: Colors.blue,),
        home: MyHomePage(title: 'Demo animation', animation: animation,)
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title,required this.animation}): super(key: key);
  final String title;
  final items = Product.getProducts();
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Product Listing")),
        body:
        ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: index <= 2? FadeTransition(
                  child: ProductBox(item: items[index]),
                  opacity: animation,
                ) : MyAnimatedWidget(child: ProductBox(item: items[index]), animation: animation),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage(item: items[index]),
                  )
                  );
                },
              );
            }
        )

    );
  }
}
class Product {
  final String name;
  final String description;
  final int price;
  final String image;

  Product(this.name, this.description, this.price, this.image);
  static List<Product> getProducts() {
    List<Product> items = <Product>[];

    items.add(
        Product(
          "iPhone",
          "iPhone is the stylist phone ever", 1000,
          "iphone.jpg",
        )
    );
    items.add(
        Product(
          "Pixel",
          "Pixel is the most feature-full phone ever", 800,
          "pixel1.jpg",
        )
    );
    items.add(
        Product(
          "Laptop", "Laptop is most productive development tool", 2000,
          "laptop.jpg",
        )
    );
    items.add(
        Product(
          "Tablet",
          "Tablet is the most useful device ever for meeting", 1500,
          "tablet.jpg",
        )
    );
    items.add(
        Product(
          "Pendrive",
          "Pendrive is useful storage medium", 100,
          "pendriver.jpg",
        )
    );
    items.add(
        Product(
          "Floppy Drive",
          "Floppy drive is useful rescue storage medium", 20,
          "floppydisk.jpg",
        )
    );
    return items;
  }
}

class ProductPage extends StatelessWidget {
  ProductPage({Key? key, required this.item}) : super(key: key);
  final Product item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset("assets/" + item.image, height: 150.0, width: MediaQuery.of(context).size.width),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(item.name, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
                          Text(item.description,style: TextStyle(fontSize: 15),),
                          Text("Price: " + item.price.toString()),
                          RatingBox(),
                        ],
                      )
                  ))
            ],
          ),
        ),
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
  const ProductBox({Key? key, required this.item}) :super(key: key);
  final Product item;

  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(2), height: 150, child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
          Image.asset("assets/"+ item.image), Expanded(
              child: Container(
                padding: EdgeInsets.all(5), child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(item.description),
                  Text("Price: " + item.toString()),
                  RatingBox(),
                ],
              ),
              )
          )
        ],
        )
    )
    );
  }
}
class MyAnimatedWidget extends StatelessWidget {
  MyAnimatedWidget({required this.child, required this.animation});
  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) => Center(
    child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Container(
          child: Opacity(opacity: animation.value, child: child),
        ),
        child: child
    ),
  );
}