import 'package:flutter/material.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('assets/images/Frame.png'),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Your Cart is empty',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              'Sorry, the keyword you entered cannot be found, please check again or search with another keyword.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17.0, color: Colors.grey),
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
