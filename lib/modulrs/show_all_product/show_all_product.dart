import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie/layout/home/cubits/cubit.dart';
import 'package:la_vie/layout/home/cubits/states.dart';
import 'package:la_vie/modulrs/my_cart/my_cart_info/my_cart_info_screen.dart';
import 'package:la_vie/modulrs/search/search_screen.dart';
import 'package:la_vie/modulrs/show_all_product/plants/plants_card.dart';
import 'package:la_vie/modulrs/show_all_product/product/product_card.dart';
import 'package:la_vie/modulrs/show_all_product/speed/speed_card.dart';
import 'package:la_vie/modulrs/show_all_product/tools/tools_card.dart';
import 'package:la_vie/shared/components/component.dart';

class TemplateScreen extends StatefulWidget {
  const TemplateScreen({Key? key}) : super(key: key);

  @override
  State<TemplateScreen> createState() => _TemplateScreenState();
}

class _TemplateScreenState extends State<TemplateScreen> {
  final TextEditingController searchController = TextEditingController();

  int i = 0;

  Widget g(int index, LavieCubit cubit) {
    switch (i) {
      case 0:
        return buildProductCard(index, cubit);

      case 1:
        return buildPlantsCard(index, cubit);

      case 2:
        return buildSpeedCard(index, cubit);

      case 3:
        return buildToolsCard(index, cubit);

      default:
        return buildProductCard(index, cubit);
    }
  }

  // BoxDecoration y() {
  //   print(i);
  //   switch (i) {
  //     case 0:
  //       return BoxDecoration(
  //         borderRadius: BorderRadius.circular(10.0),
  //         border: Border.all(color: HexColor('#1ABC00')),
  //       );
  //
  //     case 1:
  //       return BoxDecoration(
  //         borderRadius: BorderRadius.circular(10.0),
  //         border: Border.all(color: HexColor('#1ABC00')),
  //       );
  //
  //     case 2:
  //       return BoxDecoration(
  //         borderRadius: BorderRadius.circular(10.0),
  //         border: Border.all(color: HexColor('#1ABC00')),
  //       );
  //
  //     case 3:
  //       return BoxDecoration(
  //         borderRadius: BorderRadius.circular(10.0),
  //         border: Border.all(color: HexColor('#1ABC00')),
  //       );
  //
  //     default:
  //       return BoxDecoration(
  //         borderRadius: BorderRadius.circular(10.0),
  //         border: Border.all(color: HexColor('#1ABC00')),
  //       );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LavieCubit, LavieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: LavieCubit.get(context).productModel != null,
          builder: (context) {
            var cubit = LavieCubit.get(context);

            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Center(
                      child: Image(
                        image: AssetImage('assets/images/lavie_login.png'),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: searchController,
                            onTap: () {
                              NavigatorTo(context, SearchScreen());
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                8.0,
                              )),
                              prefixIcon: const Icon(
                                Icons.search,
                              ),
                              label: const Text('Search'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: HexColor('#1ABC00'),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              NavigatorTo(context, const MyCartScreenInfo());
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 50,
                            decoration: i == 0
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border:
                                        Border.all(color: HexColor('#1ABC00')),
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
                                  'All',
                                  style: TextStyle(
                                    color: i == 0
                                        ? HexColor('#1ABC00')
                                        : Colors.grey,
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
                                    border:
                                        Border.all(color: HexColor('#1ABC00')),
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
                                  'Plants',
                                  style: TextStyle(
                                    color: i == 1
                                        ? HexColor('#1ABC00')
                                        : Colors.grey,
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
                            decoration: i == 2
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border:
                                        Border.all(color: HexColor('#1ABC00')),
                                  )
                                : BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                            child: Center(
                              child: TextButton(
                                onPressed: () {
                                  if (i == 2) return;
                                  i = 2;
                                  setState(() {});
                                },
                                child: Text(
                                  'Seeds',
                                  style: TextStyle(
                                    color: i == 2
                                        ? HexColor('#1ABC00')
                                        : Colors.grey,
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
                            decoration: i == 3
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border:
                                        Border.all(color: HexColor('#1ABC00')),
                                  )
                                : BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                            child: Center(
                              child: TextButton(
                                onPressed: () {
                                  if (i == 3) return;
                                  i = 3;
                                  setState(() {});
                                },
                                child: Text(
                                  'Tools',
                                  style: TextStyle(
                                    color: i == 3
                                        ? HexColor('#1ABC00')
                                        : Colors.grey,
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
                    ), // ديه الجزء الخاص بيها في كله
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: Container(
                          height: 500,
                          width: double.infinity,
                          color: Colors.white,
                          //فين الليست
                          child: GridView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: cubit.productModel!.data!.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 5.0,
                                crossAxisSpacing: 5.0,
                                childAspectRatio: 1 / 1.4,
                              ),
                              itemBuilder: (context, index) {
                                return g(index, cubit);
                              })),
                    ),
                  ],
                ),
              ),
            );
          },
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

//ه الاساسي
  Widget buildProductCard(int index, LavieCubit cubit) {
    return ProductCard(
      index: index,
      cubit: cubit,
    );
  }

  Widget buildPlantsCard(int index, LavieCubit cubit) {
    return PlantsCard(
      index: index,
      cubit: cubit,
    );
  }

  Widget buildSpeedCard(int index, LavieCubit cubit) {
    return SpeedCard(
      index: index,
      cubit: cubit,
    );
  }

  Widget buildToolsCard(int index, LavieCubit cubit) {
    return ToolsCard(
      index: index,
      cubit: cubit,
    );
  }
}
