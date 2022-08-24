import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie/shared/components/component.dart';

class AddPost extends StatelessWidget {
  var titlecontroller = TextEditingController();
  var descriptioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create New Post',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Container(
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: HexColor('#1ABC00'),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: HexColor('#1ABC00'),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Add Photo',
                      style: TextStyle(
                        color: HexColor('#1ABC00'),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Title',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                defualtFormField(
                  Type: TextInputType.emailAddress,
                  Controller: titlecontroller,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Description',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Container(
                  width: double.infinity,
                  height: 120.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            defaultButtom(function: () {}, text: 'post'),
          ],
        ),
      ),
    );
  }
}
