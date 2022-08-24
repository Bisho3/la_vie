import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie/layout/home/cubits/cubit.dart';
import 'package:la_vie/layout/home/cubits/states.dart';
import 'package:la_vie/models/blog/blogsmmodel.dart';
import 'package:la_vie/modulrs/scan/single_blog_screen.dart';
import 'package:la_vie/shared/components/component.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = LavieCubit.get(context);
    return BlocConsumer<LavieCubit, LavieStates>(
      listener: (context, stat) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Blogs',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 600,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildBlogIteem(cubit.blogsModel!, index, context),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                    itemCount: cubit.blogsModel!.data!.plants!.length,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildBlogIteem(BlogsModel model, int index, context) => InkWell(
        onTap: () {
          NavigatorTo(context, SingleBlogScreen());
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
              color: HexColor('#FFFFFF'),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                Container(
                  height: 120.0,
                  width: 100,
                  margin: const EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:
                        'https://lavie.orangedigitalcenteregypt.com${model.data!.plants![index].imageUrl}',
                    // في حالة التحميل
                    progressIndicatorBuilder: (context, url, progress) =>
                        CircularProgressIndicator(
                      value: progress.progress,
                    ),
                    // في حالة الخطا
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  flex: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '2 days ago',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13.0,
                            color: HexColor('#1ABC00')),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '${model.data!.plants![index].name}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '${model.data!.plants![index].description}',
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.grey[400],
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '${model.data!.plants![index].description}',
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.grey[400],
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
