import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie/layout/home/cubits/cubit.dart';
import 'package:la_vie/layout/home/cubits/states.dart';
import 'package:la_vie/modulrs/formus/add_post.dart';
import 'package:la_vie/modulrs/formus/formus_card/all_formuscard.dart';
import 'package:la_vie/modulrs/formus/formus_card/my_formuscard.dart';
import 'package:la_vie/modulrs/search/search_screen.dart';
import 'package:la_vie/shared/components/component.dart';

class FormusOneScreen extends StatefulWidget {
  @override
  State<FormusOneScreen> createState() => _FormusOneScreenState();
}

class _FormusOneScreenState extends State<FormusOneScreen> {
  final TextEditingController searchController = TextEditingController();
  int i = 0;

  Widget g(int index, LavieCubit cubit) {
    switch (i) {
      case 0:
        return buildAllFormusCard(index, cubit);

      case 1:
        return buildMyFormussCard(index, cubit);
      default:
        return buildAllFormusCard(index, cubit);
    }
  }

  @override
  Widget build(BuildContext context) {
    var cubit = LavieCubit.get(context);
    return BlocConsumer<LavieCubit, LavieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.black,
                          )),
                      const SizedBox(
                        width: 40,
                      ),
                      const Text(
                        'Discussion Forums',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  color: Colors.grey[100],
                  child: TextFormField(
                    onTap: () {
                      NavigatorTo(context, SearchScreen());
                    },
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      label: Text('Search'),
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 50,
                      decoration: i == 0
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: HexColor('#1ABC00'),
                              ),
                            )
                          : BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            if (i == 0) return;
                            i = 0;
                            setState(() {});
                          },
                          child: Text(
                            'All Formus',
                            style: TextStyle(
                              color: i == 0 ? HexColor('#1ABC00') : Colors.grey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'roboto',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 100,
                      height: 50,
                      decoration: i == 1
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: HexColor('#1ABC00')),
                            )
                          : BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            if (i == 1) return;
                            i = 1;
                            setState(() {});
                          },
                          child: Text(
                            'My Formus',
                            style: TextStyle(
                              color: i == 1 ? HexColor('#1ABC00') : Colors.grey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'roboto',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return g(index, cubit);
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20.0,
                    ),
                    itemCount: cubit.formusModel!.data!.length,
                  ),
                ),
              ],
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 45),
              child: FloatingActionButton(
                onPressed: () {
                  NavigatorTo(context, AddPost());
                },
                child: const Icon(Icons.add),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildAllFormusCard(int index, LavieCubit cubit) {
    return AllFormusCard(
      index: index,
      cubit: cubit,
    );
  }

  Widget buildMyFormussCard(int index, LavieCubit cubit) {
    return MyFormusCard(
      index: index,
      cubit: cubit,
    );
  }
}
