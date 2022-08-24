import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie/layout/home/home_screen.dart';
import 'package:la_vie/modulrs/login/login_screen.dart';
import 'package:la_vie/modulrs/register/cubits/cubit.dart';
import 'package:la_vie/modulrs/register/cubits/states.dart';
import 'package:la_vie/shared/components/component.dart';
import 'package:la_vie/shared/components/constant.dart';
import 'package:la_vie/shared/network/local/cache_helper.dart';

class ResisterScreen extends StatelessWidget {
  ResisterScreen({Key? key}) : super(key: key);
  var firstnamecontroller = TextEditingController();
  var lastnamecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var confirmpasswordcontroller = TextEditingController();
  var FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.registerModel.type == 'Success') {
              print(state.registerModel.message);
              print(state.registerModel.data.accessToken);
              CacheHelper.saveData(
                key: 'accessToken',
                value: state.registerModel.data.accessToken,
              ).then((value) {
                accessToken = state.registerModel.data.accessToken!;
                NavigatorAndRemove(context, HomeScreen());
              });
              ShowToast(
                  text: state.registerModel.message,
                  state: ToastStates.SUCCESS);
            } else {
              print(state.registerModel.message);
              ShowToast(
                  text: 'Incorrect Email or Password',
                  state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Stack(
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
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                      'Sign Up',
                                      style: TextStyle(
                                        color: HexColor('#1ABC00'),
                                        fontSize: 18.0,
                                        fontFamily: 'roboto',
                                      ),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    NavigatorTo(context, LoginScreen());
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'First Name',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      defualtFormField(
                                        Type: TextInputType.text,
                                        Controller: firstnamecontroller,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return 'Must Enter Your Your Name';
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Last Name',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      defualtFormField(
                                        Type: TextInputType.text,
                                        Controller: lastnamecontroller,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return 'Must Enter Your Last Name';
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
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
                                    ' Email Address',
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
                                      return 'Must Enter Your Email Adress';
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
                                    'Confirm Password',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                defualtFormField(
                                  Type: TextInputType.emailAddress,
                                  Controller: confirmpasswordcontroller,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Must Enter Your Confirm Password';
                                    }
                                    if (passwordcontroller.text !=
                                        confirmpasswordcontroller.text) {
                                      return 'Password Do Not Match';
                                    }
                                    return null;
                                  },
                                  isPassword: true,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            ConditionalBuilder(
                              condition: state is! RegisterLoadingState,
                              builder: (context) => defaultButtom(
                                function: () {
                                  if (FormKey.currentState!.validate()) {
                                    RegisterCubit.get(context).UserRegister(
                                      firstname: firstnamecontroller.text,
                                      lastname: lastnamecontroller.text,
                                      email: emailcontroller.text,
                                      password: passwordcontroller.text,
                                    );
                                  }
                                },
                                text: 'Login',
                                isUpperCase: false,
                              ),
                              fallback: (context) => const Center(
                                  child: CircularProgressIndicator()),
                            ),
                            const SizedBox(
                              height: 25.0,
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
          );
        },
      ),
    );
  }
}
