import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zayed/models/place_model.dart';
import 'package:zayed/models/product_item.dart';
import 'package:zayed/modules/products/open_product_screen.dart';
import 'package:zayed/shared/style/style.dart';




void showToast({
  required String text,
  required Color toastColor,
}) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: toastColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

enum ToastColors {
  SUCCESS,
  ERROR,
  WARNING,
}

Color setToastColor(ToastColors color) {
  Color c;

  switch (color) {
    case ToastColors.ERROR:
      c = Colors.red;
      break;
    case ToastColors.SUCCESS:
      c = Colors.green;
      break;
    case ToastColors.WARNING:
      c = Colors.amber;
      break;
  }

  return c;
}

List imageList = [
  'images/first.jpg',
  'images/second.jpg',
  'images/third.jpeg',
  "images/fourth.jpg",
];

Widget buildSlider() {
  return Container(
    padding: EdgeInsets.all(10),
    child: CarouselSlider.builder(
      itemCount: imageList.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Image.asset(
            imageList[index],
            fit: BoxFit.cover,
          ),
        );
      },
      options: CarouselOptions(
        height: 180,
        initialPage: 0,
      ),
    ),
  );
}

List placesImg = [
  'images/restaurant.jpg',
  'images/atm.jpg',
  'images/bank.jpg',
  'images/beauty.jpg',
  'images/cafe.jpg',
  'images/car.jpg',
  'images/charities.jpg',
  'images/clinics.jpg',
];

List placeNameList = [
  'Restaurant',
  'ATMs',
  'Banks',
  'Beauty',
  'Cafe',
  'Car service',
  'Charities',
  'Clinics',
];

Widget buildGridView() {
  return Container(
    child: GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: placesImg.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100, mainAxisSpacing: 10, crossAxisSpacing: 10),
      itemBuilder: (BuildContext context, int index) {
        return buildInkWellCategory(placesImg[index], placeNameList[index]);
      },
    ),
  );
}

InkWell buildInkWellCategory(String imageName, String placeName) {
  return InkWell(
    onTap: () {},
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imageName),
            ),
          ),
        ),
        Text(placeName),
      ],
    ),
  );
}

Widget buildRecentProductItem(context, ProductItem productItem) {
  return InkWell(
    onTap: (){
      Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) =>
                  Product(productItem)));
    },
    child: Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 5, 8, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width / 2.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(productItem.productImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              productItem.productName,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "${productItem.productPrice}",
              style: coloredWordsStyle(),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget mainHomeRow({required String label}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: labelsStyle(),
      ),
      Container(
        child: Row(
          children: [
            Text(
              "show all",
              style: coloredWordsStyle(),
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.red,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget buildPlaceCard(context,PlaceModel placeModel) {
  return InkWell(
    onTap: () {},
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0,12,10,5),
      child: Container(
        height: MediaQuery.of(context).size.height / 2.8,
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(placeModel.placeImage),
                      //fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  alignment: AlignmentDirectional.center,
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepOrange.withOpacity(.9),
                  ),
                  child: Text("${placeModel.distance} m ",style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
            Text(
              placeModel.placeName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              placeModel.location,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Container(
                  height: 30,
                 child:  Row(
                   children: [
                     Icon(Icons.star_border),
                     Text("0 ( ${placeModel.rate} )")
                   ],
                 ),

                ),
                Spacer(),
                Container(
                  alignment: AlignmentDirectional.center,
                  height: 30,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: Text(placeModel.category,style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
