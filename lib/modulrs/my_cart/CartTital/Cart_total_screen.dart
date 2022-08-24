import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie/shared/components/component.dart';

class CartTotalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  '180,000 ECP',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: HexColor('#1ABC00'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            defaultButtom(
              function: () {},
              text: 'Checkout',
            ),
          ],
        ),
      ),
    );
  }
}
