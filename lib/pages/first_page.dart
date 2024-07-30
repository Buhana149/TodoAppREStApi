import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/colors.dart';
import 'package:todoapp_restapi/pages/todo_page.dart';
import 'package:todoapp_restapi/utils/categories.dart';
import 'package:todoapp_restapi/utils/categories_tile.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final List<Categories> _categories = [
    Categories(icon: Icons.person, type: 'Personal'),
    Categories(icon: Icons.work_outline, type: 'Work'),
    Categories(icon: Icons.portrait_sharp, type: 'Portofolio'),
    Categories(icon: Icons.hotel_outlined, type: 'Hobbies')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text(
            'CheckBox',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      backgroundColor: primaryColor,
      body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              const Text(
                'Hey David,',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const Text(
                'Keep it Going, You Got This!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 400,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green[200],
                    borderRadius: BorderRadius.circular(5)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.camera_roll_outlined),
                      Text(
                        'Saffola Meeting',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 120,
                      ),
                      Text('View Calendar'),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Your Task Categories',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _categories.length,
                      itemBuilder: (context, index) {
                        return CategoriesTile(
                            icon: _categories[index].icon,
                            child: _categories[index].type);
                      }),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      height: 150,
                      width: 170,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.type_specimen,
                              color: Colors.white,
                            ),
                            Text(
                              'Due this week',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '2 projects',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    height: 150,
                    width: 170,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.type_specimen,
                            color: Colors.white,
                          ),
                          Text(
                            'This week\'s Activity',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '48 Tasks',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
               const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Tasks for today',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 140,
                    ),
                    Text('View All'),
                    Icon(Icons.keyboard_arrow_right_outlined)
                  ],
                ),
              ),
              Container(height: 500, child: const TodoPage())
            ],
          )),
    );
  }
}
