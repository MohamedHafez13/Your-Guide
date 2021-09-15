import 'dart:core';

class ProductItem {
 late String productName;
 late String shopName;
 late String productImage;
 late String productPrice;
 late String productDescription;
 // bool inStock;

  ProductItem(this.shopName, this.productName,
      this.productDescription, this.productImage, this.productPrice);
}
