import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/layout/home/cubits/cubit.dart';
import 'package:la_vie/layout/home/cubits/states.dart';
import 'package:la_vie/modulrs/scan/blog_screen.dart';
import 'package:la_vie/shared/components/component.dart';

class SingleBlogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LavieCubit, LavieStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LavieCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: Image(
                            image: NetworkImage(
                              'https://lavie.orangedigitalcenteregypt.com${cubit.blogsSearchModel!.data!.imageUrl}',
                            ),
                            fit: BoxFit.cover,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: IconButton(
                            onPressed: () {
                              NavigatorAndRemove(context, BlogScreen());
                            },
                            icon: const Icon(Icons.arrow_back)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${cubit.blogsSearchModel!.data!.name}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          '${cubit.blogsSearchModel!.data!.description}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            height: 1.50,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Water Capacity: ${cubit.blogsSearchModel!.data!.waterCapacity}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            height: 1.50,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Sun Light: ${cubit.blogsSearchModel!.data!.sunLight}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            height: 1.50,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Temperature: ${cubit.blogsSearchModel!.data!.temperature}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            height: 1.50,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          'leaf, in botany, any usually flattened green outgrowth from the stem of  ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            height: 1.50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
