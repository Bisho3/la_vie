import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/layout/home/cubits/cubit.dart';
import 'package:la_vie/layout/home/cubits/states.dart';
import 'package:la_vie/layout/home/home_screen.dart';
import 'package:la_vie/models/profile/update_profile/update_profile_screen.dart';
import 'package:la_vie/shared/components/component.dart';
import 'package:la_vie/shared/components/constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = LavieCubit.get(context);

    return BlocConsumer<LavieCubit, LavieStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LavieCubit.get(context);
          return Scaffold(
            extendBody: true,
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter,
                  image: NetworkImage(
                      'https://scontent.fcai19-4.fna.fbcdn.net/v/t39.30808-6/245340242_1273721529722297_1081010833049559896_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=AMZfYIPaUdUAX9xPzqv&tn=59KSOxiDYof8Dm0i&_nc_ht=scontent.fcai19-4.fna&oh=00_AT9gnFXbdHMZqN9dvTv5Giz0U1pZWbdKNSEA_Rw0kapvRQ&oe=63096215'),
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.65),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            NavigatorTo(context, HomeScreen());
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 27,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                            size: 27,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 90),
                        CircleAvatar(
                          foregroundImage: NetworkImage(
                              '${cubit.profileModel!.data!.imageUrl}'),
                          radius: 50,
                          backgroundColor: Colors.white.withOpacity(0),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${cubit.profileModel!.data!.firstName}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Roboto-Regular",
                                  fontSize: 24),
                            ),
                            const SizedBox(
                              width: 6.0,
                            ),
                            Text(
                              '${cubit.profileModel!.data!.lastName}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Roboto-Regular",
                                  fontSize: 24),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 290),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          )),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40, right: 30, top: 20),
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.1),
                              ),
                              // color: Colors.grey.withOpacity(0.1),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: const [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundImage: AssetImage(
                                          "assets/images/Group 1264.png"),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "You have 30 points",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Roboto-Regular",
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 220),
                            child: Text(
                              "Edit Profile ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Roboto-Regular",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 320,
                            height: 70,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.2)),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 35,
                                    height: 35,
                                    child:
                                        Image.asset("assets/images/icon.png"),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Text(
                                    "Change Name ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Roboto-Regular",
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    width: 80,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        NavigatorTo(
                                            context, UpdateProfileScreen());
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                        color: Color(0xff1D592C),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 320,
                            height: 70,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.2)),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 35,
                                    height: 35,
                                    child:
                                        Image.asset("assets/images/icon.png"),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Text(
                                    "Change Email",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Roboto-Regular",
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    width: 80,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        NavigatorTo(
                                            context, UpdateProfileScreen());
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                        color: Color(0xff1D592C),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: defaultButtom(
                                function: () {
                                  signOut(context);
                                },
                                text: 'LogOut',
                                isUpperCase: false),
                          ),
                        ],
                        //  Text(MainCubit.get(context).loginModel!.data.user.firstName,style: TextStyle(color:Colors.white,fontWeight: FontWeight.w700,fontFamily: "Roboto-Regular",fontSize: 24),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
