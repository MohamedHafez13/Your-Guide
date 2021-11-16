import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zayed/layout/home/my_home_page.dart';
import 'package:zayed/modules/register/register_cubit.dart';
import 'package:zayed/modules/register/register_states.dart';
import 'package:zayed/shared/component/components.dart';
import 'package:zayed/shared/component/home_widgets/components.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context)=> RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
        listener: (context,state){
          if(state is RegisterErrorState){
            showToast(text: state.error, toastColor: Colors.red);
          }else if (state is RegisterSuccessState)
          {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MyHomePage()));
          }
        },
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              title: Text("Register"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Register",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 22,
                        ),
                        defaultTextForm(
                            controller: userNameController,
                            type: TextInputType.name,
                            hintText: "User Name",
                            labelText: "User Name",
                            prefixIcon: Icons.person_rounded,
                            validation: (String? value) {
                              if (value!.isEmpty) {
                                return "Enter Your Name";
                              }
                            }),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 22,
                        ),
                        defaultTextForm(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            hintText: "Email Address",
                            labelText: "Email",
                            prefixIcon: Icons.email,
                            validation: (String? value) {
                              if (value!.isEmpty) {
                                return "Enter Your Email";
                              }
                            }),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 22,
                        ),
                        defaultTextForm(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            isPassword:  RegisterCubit.get(context).obscureText,
                            hintText: "Password",
                            labelText: "Password",
                            prefixIcon: Icons.lock_outline,
                            suffixIcon: RegisterCubit.get(context).iconData,
                            suffixIconFunction: (){
                              RegisterCubit.get(context).changePasswordVisibilityIcon();
                            },
                            validation: (String? value) {
                              if (value!.isEmpty) {
                                return "Enter Your Password";
                              }
                            }),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 22,
                        ),
                        defaultTextForm(
                            controller: phoneController,
                            type: TextInputType.number,
                            hintText: "Phone number",
                            labelText: "Phone number",
                            prefixIcon: Icons.phone,
                            validation: (String? value) {
                              if (value!.isEmpty) {
                                return "Enter Your Phone";
                              }
                            }),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 22,
                        ),
                        defaultButton(
                            width: double.infinity,
                            backGroundColor: Colors.blueAccent,
                            label: "Register",
                            labelColor: Colors.white,
                            onPress: () {
                              if (formKey.currentState != null &&
                                  formKey.currentState!.validate()) {
                                RegisterCubit.get(context).createUser(
                                    name: userNameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    phone: phoneController.text
                                );

                              }
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
