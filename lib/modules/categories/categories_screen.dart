import 'package:flutter/material.dart';
import 'package:zayed/shared/component/app_Bar.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        pageTitle: 'Categories',
        backGroundColor: Colors.white,
      ),
    );
  }
}
