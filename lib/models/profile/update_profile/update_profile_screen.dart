import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/layout/home/cubits/cubit.dart';
import 'package:la_vie/layout/home/cubits/states.dart';
import 'package:la_vie/modulrs/profile/profile_screen.dart';
import 'package:la_vie/shared/components/component.dart';

class UpdateProfileScreen extends StatelessWidget {
  var FormKey = GlobalKey<FormState>();
  var firstnamecontroller = TextEditingController();
  var lastnamecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var addresscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LavieCubit, LavieStates>(
      listener: (context, state) {},
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
              Padding(
                padding: const EdgeInsets.only(
                  top: 30.0,
                  left: 10,
                ),
                child: IconButton(
                  onPressed: () {
                    NavigatorAndRemove(context, ProfileScreen());
                  },
                  icon: Icon(Icons.arrow_back),
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
                          Image(
                            image: AssetImage('assets/images/lavie_login.png'),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          if (state is LavieLoadingProfileUpdateStates)
                            LinearProgressIndicator(),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'First Name',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    SizedBox(
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
                              SizedBox(
                                width: 15.0,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Last Name',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    SizedBox(
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
                          SizedBox(
                            height: 15.0,
                          ),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  ' Email Address',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              SizedBox(
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
                          SizedBox(
                            height: 15.0,
                          ),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Address',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              defualtFormField(
                                Type: TextInputType.text,
                                Controller: addresscontroller,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Must Enter Your Address';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              defaultButtom(
                                function: () {
                                  if (FormKey.currentState!.validate()) {
                                    LavieCubit.get(context).putUserData(
                                        firstName: firstnamecontroller.text,
                                        lastName: lastnamecontroller.text,
                                        emailAddress: emailcontroller.text,
                                        address: addresscontroller.text);
                                  }
                                  NavigatorAndRemove(context, ProfileScreen());
                                },
                                text: 'Update',
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
    );
  }
}
