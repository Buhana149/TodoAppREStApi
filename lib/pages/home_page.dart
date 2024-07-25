import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/colors.dart';
import 'package:todoapp_restapi/utils/categories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Categories> _categories = [
    Categories(icon: Icons.person, type: 'Personal'),
    Categories(icon: Icons.work_outline, type: 'Work'),
    Categories(icon: Icons.portrait_sharp, type: 'Portofolio'),
    Categories(icon: Icons.hotel_outlined, type: 'Hobbies')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'CheckBox',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Header',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Container(
              height: 200.0,
              width: 500,
              child: ListView.builder(
                // shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  Container(
                width: 150.0,
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                color: Colors.blueAccent,
                child: Center(
                  child: Text(
                    'Item $index',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              );
                },
              ),
            ),
            // const Text(
            //   'Hey David,',
            //   style: TextStyle(
            //     fontSize: 15,
            //   ),
            // ),
            // const Text(
            //   'Keep it Going, You Got This!',
            //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // Container(
            //   width: 400,
            //   height: 50,
            //   decoration: BoxDecoration(
            //       color: Colors.green[200],
            //       borderRadius: BorderRadius.circular(5)),
            //   child: const Padding(
            //     padding: EdgeInsets.all(8.0),
            //     child: Row(
            //       children: [
            //         Icon(Icons.camera_roll_outlined),
            //         Text(
            //           'Saffola Meeting',
            //           style: TextStyle(fontWeight: FontWeight.bold),
            //         ),
            //         SizedBox(
            //           width: 120,
            //         ),
            //         Text('View Calendar'),
            //         Icon(
            //           Icons.arrow_forward_ios,
            //           size: 15,
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // const Text(
            //   'Your Task Categories',
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            // ),
            // SizedBox(
            //   height: 510,
            //   child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemCount: _categories.length,
            //       itemBuilder: (context, index) {
            //        return ListTile(
            //     title: Text(_categories[index].type),
            //     // leading: _categories[index].icon,

            //        );
            //       }),
            // )
          ],
        ),
      ),
    );
  }
}
