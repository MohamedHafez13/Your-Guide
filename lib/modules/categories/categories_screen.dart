import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zayed/shared/component/app_Bar.dart';
import 'package:zayed/shared/component/home_widgets/components.dart';
import 'package:zayed/shared/style/style.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  buildAppBar(
          pageTitle: "Categories",
          firstIcon: Icons.arrow_back_outlined,
          firstIconNavigator: () {
            Navigator.of(context).pop();
          }),
      body: Container(
        width: double.infinity,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: placesImg.length,
          itemBuilder: (context, index) =>InkWell(
            onTap: (){},
            child: Container(
              padding: EdgeInsets.only(bottom: 5),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 4.1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(placesImg[index]),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Text(
                    "${placeNameList[index]}",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
