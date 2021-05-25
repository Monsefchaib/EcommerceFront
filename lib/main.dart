import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_apptest/components/horizontal_listview.dart';
import 'package:flutter_apptest/components/login.dart';
import 'package:flutter_apptest/components/product.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false, //7iyed dakchi li foug appbar
    home:login()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
 Widget build(BuildContext context) {
    // TODO: implement build
    Widget image_carousel = new Container(
      margin: EdgeInsets.all(4),
      height: 180,
      child: Carousel(
        boxFit: BoxFit.fill, // so that the images fit the box
        images: [
          AssetImage('ecimages/1.png'),
          AssetImage('ecimages/2.png'),
          AssetImage('ecimages/3.png'),
        ],
        autoplay: true,
        borderRadius: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        dotSpacing: 15.0,
        dotColor: Colors.lightGreenAccent,
        indicatorBgPadding: 5.0,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 241, 241, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        title: Text('LaJotiya'),

          actions: <Widget>[
          IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: null,),

          IconButton(
           icon: CircleAvatar(
               radius: 30,
               child: Image.network('https://cutt.ly/bb7Bl6M',fit: BoxFit.fill)),
          onPressed: null,),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text('Test'),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(radius: 30, child: Image.network('https://cutt.ly/bb7Bl6M',fit: BoxFit.fill),
                  ) // add background-image instead of background color for the image
                ),
                accountEmail: Text('Test@test.com'),
                decoration : BoxDecoration(color: Colors.deepPurpleAccent),
            ),
            InkWell(
              onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new MyApp())),
              child: ListTile(
              title: Text('Home'),
                leading:Icon(Icons.home_rounded),
              ),
            ),
            InkWell(
              onTap: (){print('Clicked');},
              child: ListTile(
                title: Text('Categories'),
                leading:Icon(Icons.widgets),
              ),
            ),
            InkWell(
              onTap: (){print('Clicked');},
              child: ListTile(
                title: Text('Favourites'),
                leading:Icon(Icons.favorite),
              ),
            ),
          SizedBox(height: 70,),
            InkWell(
          onTap: (){print('Clicked');},
           child: ListTile(
          title: Text('My Account'),
          leading:Icon(Icons.account_box),
        ),
        ),
      InkWell(
        onTap: (){print('Clicked');},
        child: ListTile(
          title: Text('My Orders'),
          leading:Icon(Icons.shopping_bag_rounded),
        ),
      ),
        InkWell(
          onTap: (){print('Clicked');},
          child: ListTile(
            title: Text('About'),
            leading:Icon(Icons.help, color: Colors.blue,),
          ),
        ),

          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(8),
              child: Text('Categories', style :TextStyle(fontWeight: FontWeight.bold))),
          ////// Horizontal List View For Categories
          HorizontalList(),
          image_carousel,
          Padding(padding: EdgeInsets.all(8),
              child: Text('Recent items',style: TextStyle(fontWeight: FontWeight.bold) ,)),
          SizedBox(
            height: 400, // fixed height
            child: Products(),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(type : BottomNavigationBarType.fixed, items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', ),
        BottomNavigationBarItem(icon: Icon(Icons.widgets), label: 'Catégories'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Panier'),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profil', ),
      ]),
    );
  }
}

