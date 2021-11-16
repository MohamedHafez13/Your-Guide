import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zayed/layout/home/home_cubit/home_cubit.dart';
import 'package:zayed/layout/home/home_cubit/home_states.dart';
import 'package:zayed/models/product_item.dart';
import 'package:zayed/shared/component/app_Bar.dart';
import 'package:zayed/shared/style/style.dart';

class Product extends StatefulWidget {

  ProductItem? productItem;
  Product(this.productItem);
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xffd3d3cf),

      appBar: buildAppBar(
        pageTitle: "${widget.productItem!.productName}",
        firstIcon: Icons.arrow_back_outlined,
        firstIconNavigator: (){Navigator.of(context).pop();}
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                        AssetImage(widget.productItem!.productImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    "${widget.productItem!.productPrice}",
                    style: coloredWordsStyle(size: 20),
                  ),
                  Text(
                    "inStock",
                    style: coloredWordsStyle(size: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(widget.productItem!.productName),
                    Text(widget.productItem!.productDescription),
                  ],
                ),
                height: MediaQuery.of(context).size.height / 8,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Container(
                alignment: AlignmentDirectional.centerStart,
                padding: EdgeInsets.all(10),
                child: Text(widget.productItem!.shopName),
                height: MediaQuery.of(context).size.height / 12,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
