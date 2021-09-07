import 'package:flutter/material.dart';
import 'package:zayed/shared/component/app_Bar.dart';
import 'package:zayed/shared/component/drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(""),
        leading: Builder(
          builder: (BuildContext context)=>IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.shopping_cart_outlined),
            color: Colors.black,
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.notifications_none_outlined),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
