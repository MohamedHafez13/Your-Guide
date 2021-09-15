import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zayed/models/product_item.dart';
import 'package:zayed/shared/style/style.dart';

Widget defaultTextForm({
  required TextEditingController controller,
  required String hintText,
  required String labelText,
  IconData? prefixIcon,
  IconData? suffixIcon,
  VoidCallback? suffixIconFunction,
  FormFieldValidator<String>? validation,
  GestureTapCallback? onTap,
  required TextInputType type,
  bool isPassword = false,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: hintText,
      labelText: labelText,
      prefixIcon: IconButton(
        icon: Icon(prefixIcon),
        onPressed: () {},
      ),
      suffixIcon: IconButton(
        icon: Icon(suffixIcon),
        onPressed: suffixIconFunction,
      ),
    ),
    validator: validation,
    onTap: onTap,
    obscureText: isPassword,
  );
}

Widget defaultButton({
  required double width,
  required Color backGroundColor,
  required String label,
  required Color labelColor,
  required VoidCallback onPress,
}) {
  return Container(
    width: double.infinity,
    color: backGroundColor,
    child: MaterialButton(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: labelColor,
          ),
        ),
        onPressed: onPress),
  );
}

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


Widget buildRecentProductItem(context, ProductItem productItem)
{
  return Container(
    padding: EdgeInsets.fromLTRB(0, 5, 8, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height:  MediaQuery.of(context).size.height/4,
          width: MediaQuery.of(context).size.width/2.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(productItem.productImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(productItem.productName,style: TextStyle(fontSize: 18),),
        Text("${productItem.productPrice}" , style: coloredWordsStyle(),),
      ],
    ),
  );
}

Widget mainHomeRow({required String label}){

  return  Row(
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