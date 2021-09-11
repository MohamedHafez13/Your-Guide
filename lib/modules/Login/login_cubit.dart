import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zayed/models/user_login.dart';
import 'package:zayed/modules/Login/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  IconData iconData = Icons.visibility_off_outlined;
      // Icons.remove_red_eye;
  bool obscureText = true ;
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value)async {

      setUId();
      emit(LoginSuccessState());
      // SharedPreferences preferences =await SharedPreferences.getInstance();
      // preferences.setString('uid',"${value.user!.uid}" );

    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }

 // String userId ="";

  // Future getUid()async{
  //   SharedPreferences preferences =await SharedPreferences.getInstance();
  //   var id = preferences.getString('uid');
  //     userId =id!;
  //   emit(LoginSaveUid());
  // }

  void setUId()async{
    SharedPreferences preferences =await SharedPreferences.getInstance();
    preferences.setString('uid',"${FirebaseAuth.instance.currentUser!.uid}" );
    // emit(LoginSaveUid());
  }

  void changePasswordVisibilityIcon()
  {
    obscureText = !obscureText;
    iconData = obscureText? Icons.visibility_off_outlined:Icons.remove_red_eye;
    emit(ChangePasswordVisibility());
  }
}
