import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie/layout/home/home_screen.dart';
import 'package:la_vie/modulrs/login/cubits/cubit.dart';
import 'package:la_vie/modulrs/login/cubits/states.dart';
import 'package:la_vie/modulrs/register/register_screen.dart';
import 'package:la_vie/shared/components/component.dart';
import 'package:la_vie/shared/components/constant.dart';
import 'package:la_vie/shared/network/local/cache_helper.dart';

class LoginScreen extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessStates) {
            if (state.loginModel.type == 'Success') {
              print(state.loginModel.message);
              print(state.loginModel.data?.accessToken);
              CacheHelper.saveData(
                key: 'accessToken',
                value: state.loginModel.data?.accessToken,
              ).then((value) {
                accessToken = state.loginModel.data?.accessToken!;
                NavigatorAndRemove(context, HomeScreen());
              });
              ShowToast(
                  text: state.loginModel.message, state: ToastStates.SUCCESS);
            } else {
              print(state.loginModel.message);
              ShowToast(
                  text: 'Incorrect Email or Password',
                  state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            body: Center(
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      'assets/images/bachground.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Form(
                    key: FormKey,
                    child: Center(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Image(
                                image:
                                    AssetImage('assets/images/lavie_login.png'),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      NavigatorTo(context, ResisterScreen());
                                    },
                                    child: const Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 2.0,
                                          color: HexColor('#1ABC00'),
                                        ),
                                      ),
                                    ),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                          color: HexColor('#1ABC00'),
                                          fontSize: 18.0,
                                          fontFamily: 'roboto',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Column(
                                children: [
                                  const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Email',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  defualtFormField(
                                    Type: TextInputType.emailAddress,
                                    Controller: emailcontroller,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'Must Enter Your Email Address';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Column(
                                children: [
                                  const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Password',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  defualtFormField(
                                      Type: TextInputType.emailAddress,
                                      Controller: passwordcontroller,
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'Must Enter Your Password';
                                        }
                                        return null;
                                      },
                                      isPassword: true,
                                      onSubmit: (value) {
                                        if (FormKey.currentState!.validate()) {
                                          cubit.UserLogin(
                                            email: emailcontroller.text,
                                            password: passwordcontroller.text,
                                          );
                                        }
                                      }),
                                ],
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              ConditionalBuilder(
                                condition: state is! LoginLoadingStates,
                                builder: (context) => defaultButtom(
                                  function: () {
                                    if (FormKey.currentState!.validate()) {
                                      cubit.UserLogin(
                                        email: emailcontroller.text,
                                        password: passwordcontroller.text,
                                      );
                                    }
                                  },
                                  text: 'Login',
                                  isUpperCase: false,
                                ),
                                fallback: (context) => Center(
                                    child: const CircularProgressIndicator()),
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              Row(children: const <Widget>[
                                Expanded(child: Divider()),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  "or continue with",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(child: Divider()),
                              ]),
                              const SizedBox(
                                height: 25.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 15.0,
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/google.png'),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: const CircleAvatar(
                                      radius: 15.0,
                                      backgroundColor: Colors.white,
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/facebook.png'),
                                      ),
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
