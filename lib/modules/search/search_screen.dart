import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zayed/shared/component/app_Bar.dart';
import 'package:zayed/shared/component/components.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Color c1 = Colors.grey;
  Color c2 = Colors.orange;
  bool _firstHasBeenPressed = true;
  bool _secondHasBeenPressed = false;
  bool _productHasBeenPressed = false;
  bool _storesHasBeenPressed = true;
  double _value = 0.0;
  double _value1 = 0.0;

  int tappedIndex = -1;

  @override
  void initState() {
    super.initState();
    tappedIndex = -1;
  }

  Widget _rowWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Location:",
          style: TextStyle(fontSize: 20),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Current Location",
            style: TextStyle(color: Colors.orange, fontSize: 20),
          ),
        ),
      ],
    );
  }

  Widget sliderWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Price: ${(_value1).round()} EGP",
          style: TextStyle(fontSize: 20),
        ),
        Slider(
          inactiveColor: Colors.black12,
          activeColor: Colors.orange,
          value: _value1,
          onChanged: (double val) {
            setState(() {
              _value1 = val;
            });
          },
          max: 10000,
          min: 0,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          pageTitle: "Search",
          firstIcon: Icons.arrow_back_outlined,
          firstIconNavigator: () {
            Navigator.of(context).pop();
          }),
      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text(
                        "NEARBY ",
                        style: TextStyle(
                            fontSize: 15,
                            color: _firstHasBeenPressed
                                ? Colors.white
                                : Colors.grey),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: _firstHasBeenPressed
                            ? Colors.deepOrange
                            : Colors.white,
                        border: Border.all(
                            color: _firstHasBeenPressed
                                ? Colors.white
                                : Colors.grey),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _secondHasBeenPressed = false;
                        _firstHasBeenPressed = !_firstHasBeenPressed;
                      });
                    },
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text(
                        "RECENT ",
                        style: TextStyle(
                            fontSize: 15,
                            color: _secondHasBeenPressed
                                ? Colors.white
                                : Colors.grey),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: _secondHasBeenPressed
                            ? Colors.deepOrange
                            : Colors.white,
                        border: Border.all(
                            color: _secondHasBeenPressed
                                ? Colors.white
                                : Colors.grey),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _firstHasBeenPressed = false;
                        _secondHasBeenPressed = !_secondHasBeenPressed;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              child: _firstHasBeenPressed ? _rowWidget() : Container(),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text(
                        "PRODUCT ",
                        style: TextStyle(
                            fontSize: 15,
                            color: _productHasBeenPressed
                                ? Colors.deepOrange
                                : Colors.grey),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: _productHasBeenPressed
                                ? Colors.deepOrange
                                : Colors.grey),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _storesHasBeenPressed = false;
                        _productHasBeenPressed = !_productHasBeenPressed;
                      });
                    },
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text(
                        "STORES ",
                        style: TextStyle(
                            fontSize: 15,
                            color: _storesHasBeenPressed
                                ? Colors.deepOrange
                                : Colors.grey),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: _storesHasBeenPressed
                                ? Colors.deepOrange
                                : Colors.grey),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _productHasBeenPressed = false;
                        _storesHasBeenPressed = !_storesHasBeenPressed;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Select category",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: ListView.builder(
                  padding: EdgeInsets.all(5),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Container(
                        margin: EdgeInsets.only(right: 5),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "ALL CATEGORIES $index",
                          style: TextStyle(
                            color: tappedIndex == index ? c2 : c1,
                            fontSize: 15,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: tappedIndex == index ? c2 : c1,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          tappedIndex = index;
                        });
                      },
                    );
                  }),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                decoration:
                InputDecoration(hintText: "Write Name, Address,City"),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Radius: ${(_value).round()} Km",
                    style: TextStyle(fontSize: 20),
                  ),
                  Slider(
                    inactiveColor: Colors.black12,
                    activeColor: Colors.orange,
                    value: _value,
                    onChanged: (double val) {
                      setState(() {
                        _value = val;
                      });
                    },
                    max: 100,
                    min: 0,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child:
              _productHasBeenPressed ? sliderWidget() : Container(),
            ),
            Spacer(),
            defaultButton(
              backGroundColor: Colors.orange,
                label:"Search",
                labelColor:Colors.white,
                onPress:(){},
            )

          ],
        ),
      ),

    );
  }
}
