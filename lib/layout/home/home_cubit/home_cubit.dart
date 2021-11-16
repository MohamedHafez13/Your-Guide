import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zayed/layout/home/home_cubit/home_states.dart';
import 'package:zayed/models/product_item.dart';
import 'package:zayed/modules/book_mark/book_mark_screen.dart';
import 'package:zayed/modules/categories/categories_screen.dart';
import 'package:zayed/modules/home_Page/home.dart';

class HomeCubit extends Cubit<HomeStates>{

  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;

  List<Widget> pages= [
    Home(),
    CategoriesScreen(),
    BookMarkScreen(),
  ];
  void changeIndex(int index)
  {
    currentIndex=index;
    emit(HomeNavigationBarState());
  }

  int productIndex =0;
    List <ProductItem> productItem=[];
  // ProductItem? productItem;
  void  openRecentProduct(ProductItem item) {
    productItem.add(item);
     emit(HomeOpenRecentProduct());
  }

  // ProductItem getProduct(int index)
  // {
  //   productIndex = index;
  //   return productItem.elementAt(productIndex);
  // }



}