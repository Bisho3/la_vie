import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie/layout/home/cubits/cubit.dart';

class MyFormusCard extends StatefulWidget {
  MyFormusCard({Key? key, required this.cubit, required this.index})
      : super(key: key);
  final LavieCubit cubit;
  final int index;

  @override
  State<MyFormusCard> createState() => _MyFormusCardCardState();
}

class _MyFormusCardCardState extends State<MyFormusCard> {
  TextEditingController postcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Stack(children: [
          Column(
            children: [
              Container(
                width: 330,
                height: 250,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.3))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                              'https://lavie.orangedigitalcenteregypt.com${widget.cubit.formusModel?.data?[widget.index].imageUrl}',
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${widget.cubit.formusModel?.data?[widget.index].user?.firstName}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    '${widget.cubit.formusModel?.data?[widget.index].user?.lastName}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                "a month ago",
                                style: TextStyle(
                                    color: Color(0x979797D6).withOpacity(0.5),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 7),
                        child: Text(
                          '${widget.cubit.formusModel?.data?[widget.index].title}',
                          style: TextStyle(
                              color: HexColor('#1ABC00'),
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 7),
                        child: Text(
                          '${widget.cubit.formusModel?.data?[widget.index].description}',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 14,
                          ),
                        )),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              'https://lavie.orangedigitalcenteregypt.com${widget.cubit.formusModel?.data?[widget.index].imageUrl}',
                          // في حالة التحميل
                          progressIndicatorBuilder: (context, url, progress) =>
                              CircularProgressIndicator(
                            value: progress.progress,
                          ),
                          // في حالة الخطا
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 35,
                    child: IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        AssetImage(
                          "assets/images/Group.png",
                        ),
                        color: Colors.grey.withOpacity(0.8),
                      ),
                    ),
                  ),
                  Text(
                    "0 ",
                    style: TextStyle(
                        color: Colors.grey.withOpacity(0.8),
                        fontWeight: FontWeight.w700,
                        fontSize: 11),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    "Likes",
                    style: TextStyle(
                        color: Colors.grey.withOpacity(0.8),
                        fontWeight: FontWeight.w700,
                        fontSize: 11),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    "2  ",
                    style: TextStyle(
                        color: Colors.grey.withOpacity(0.8),
                        fontWeight: FontWeight.w700,
                        fontSize: 11),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    "Replies",
                    style: TextStyle(
                        color: Colors.grey.withOpacity(0.8),
                        fontWeight: FontWeight.w700,
                        fontSize: 11),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 220,
                    height: 30,
                    child: TextFormField(
                      textInputAction: TextInputAction.done,
                      controller: postcontroller,
                      cursorHeight: 0,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: HexColor('#1ABC00')),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: HexColor('#1ABC00')),
                            borderRadius: BorderRadius.circular(5),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    minWidth: 80,
                    height: 30,
                    color: HexColor('#1ABC00'),
                    child: const Text(
                      'Post',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
