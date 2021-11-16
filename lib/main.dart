import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zayed/layout/home/my_home_page.dart';
import 'package:zayed/modules/Login/login_screen.dart';
import 'package:zayed/modules/Login/login_states.dart';
import 'package:zayed/modules/categories/categories_screen.dart';
import 'package:zayed/modules/products/open_product_screen.dart';
import 'package:zayed/modules/splash_screen/splash_screen.dart';
import 'modules/home_Page/home.dart';
import 'modules/register/register_screen.dart';
import 'modules/search/search_screen.dart';
import 'shared/observer/observer.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // home :SearchScreen(),
      // home :CategoriesScreen(),
    );
  }
}

