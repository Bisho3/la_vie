import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie/modulrs/my_cart/CartTital/Cart_total_screen.dart';

class MyCartScreenInfo extends StatelessWidget {
  const MyCartScreenInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'My cart',
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
                itemBuilder: (context, index) => CartProductCard(),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20.0,
                ),
                itemCount: 15,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: CartTotalScreen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget CartProductCard() => Row(
        children: [
          Container(
            height: 120.0,
            width: 100,
            margin: const EdgeInsets.only(
              left: 15,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                20.0,
              ),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1660963597514-d32f381cc688?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80',
                ),
                fit: BoxFit.cover,
              ),
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
                const Text(
                  'Cactus plant',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  '200 EGP',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: HexColor(
                      '#1ABC00',
                    ),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 115,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove,
                              size: 20,
                              color: HexColor('#1ABC00'),
                            ),
                          ),
                          const Text(
                            '15',
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: HexColor('#1ABC00'),
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete),
                      color: HexColor('#1ABC00'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
}
