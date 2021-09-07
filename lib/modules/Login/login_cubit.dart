import 'package:bloc/bloc.dart';
import 'package:zayed/modules/Login/login_states.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitialState());
}