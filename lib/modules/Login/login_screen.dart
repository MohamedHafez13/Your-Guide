import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zayed/layout/home/my_home_page.dart';
import 'package:zayed/modules/Login/login_cubit.dart';
import 'package:zayed/modules/Login/login_states.dart';
import 'package:zayed/modules/register/register_screen.dart';
import 'package:zayed/shared/component/components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (BuildContext context, Object? state) {  },
        builder: (BuildContext context, state) {
          return  Scaffold(
            appBar: AppBar(
              title: Text("Login"),
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
                          "Login",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
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
                            isPassword: true,
                            hintText: "Password",
                            labelText: "Password",
                            prefixIcon: Icons.lock_outline,
                            suffixIcon: Icons.remove_red_eye,
                            validation: (String? value) {
                              if (value!.isEmpty) {
                                return "Enter Your Email";
                              }
                            }),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 22,
                        ),
                        defaultButton(
                            width: double.infinity,
                            backGroundColor: Colors.blueAccent,
                            label: "Login",
                            labelColor: Colors.white,
                            onPress: () {
                              if (formKey.currentState != null &&
                                  formKey.currentState!.validate()) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MyHomePage()));
                              }
                            }
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 22,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account ?",
                              style: TextStyle(fontSize: 17),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 22,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => RegisterScreen()));
                              },
                              child: Text(
                                "Register now",
                                style:
                                TextStyle(color: Colors.blueAccent, fontSize: 17),
                              ),
                            ),
                          ],
                        ),
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
