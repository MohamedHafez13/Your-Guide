import 'package:bloc/bloc.dart';
import 'package:zayed/modules/register/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit() : super(RegisterInitialState());
}