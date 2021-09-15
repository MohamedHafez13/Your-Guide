import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zayed/layout/home/home_cubit/home_cubit.dart';
import 'package:zayed/layout/home/home_cubit/home_states.dart';
import 'package:zayed/models/product_item.dart';
import 'package:zayed/modules/products/open_product_screen.dart';
import 'package:zayed/shared/component/components.dart';
import 'package:zayed/shared/component/drawer.dart';
import 'package:zayed/shared/style/style.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
List<int> price = [100 , 200];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Color(0xffd3d3cf),
            drawer: myDrawer(),
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                "Zayed Info ",
                style: labelsStyle(),
              ),
              leading: Builder(
                builder: (BuildContext context) => IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  color: Colors.black,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart_outlined),
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_none_outlined),
                  color: Colors.black,
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: AlignmentDirectional.centerStart,
                        height: MediaQuery.of(context).size.height / 16,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Find Products,deals,shops",
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xffa7a8a0)),
                            ),
                            Icon(Icons.search),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildSlider(),
                            Text(
                              "Top Categories",
                              style: labelsStyle(),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 4,
                              child: buildGridView(),
                            ),
                            mainHomeRow(label: "Recent Products"),
                            Container(
                              height: MediaQuery.of(context).size.height / 2.7,
                              width: double.infinity,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 2,
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    HomeCubit.get(context).openRecentProduct(
                                        ProductItem("Ahmed", "test", "sss",
                                            'images/sh.jpg', '${price[index]}'));
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Product(index)));
                                  },
                                  child: buildRecentProductItem(
                                    context,
                                    ProductItem("Ahmed", "test", "sss",
                                        'images/sh.jpg', '${price[index]}'),
                                  ),
                                ),
                              ),
                            ),
                            mainHomeRow(label: "Shops nearby"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
