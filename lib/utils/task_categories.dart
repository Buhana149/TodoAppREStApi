import 'package:flutter/material.dart';
import 'package:todoapp_restapi/utils/categories.dart';
import 'package:todoapp_restapi/utils/categories_tile.dart';

class TaskCategories extends StatefulWidget {
  const TaskCategories({super.key});

  @override
  State<TaskCategories> createState() => _TaskCategoriesState();
}

class _TaskCategoriesState extends State<TaskCategories> {
  final List<Categories> _categories = [
    Categories(icon: Icons.person, type: 'Personal'),
    Categories(icon: Icons.work_outline, type: 'Work'),
    Categories(icon: Icons.portrait_sharp, type: 'Portofolio'),
    Categories(icon: Icons.hotel_outlined, type: 'Hobbies')
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
                'Your Task Categories',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
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
      ],
    );
  }
}