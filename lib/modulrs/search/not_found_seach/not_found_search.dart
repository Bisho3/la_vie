import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class NotSearchScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  NotSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.name,
                controller: searchController,
                onChanged: (searchName) {},
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.do_not_touch_outlined,
                    ),
                  ),
                  hintText: 'Search With Name oR Price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  const Text(
                    'Result For "',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    'Cactus plant',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: HexColor('#1ABC00'),
                    ),
                  ),
                  const Text(
                    '"',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '0 found',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: HexColor('#1ABC00'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60.0,
              ),
              const Image(
                image: AssetImage('assets/images/Frame.png'),
              ),
              const SizedBox(
                height: 25.0,
              ),
              const Text(
                'Not found',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                'Sorry, the keyword you entered cannot be found, please check again or search with another keyword.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17.0, color: Colors.grey),
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
