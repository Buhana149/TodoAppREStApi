import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/font_sizes.dart';

class SliverBox3 extends StatelessWidget {
  const SliverBox3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
           Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green[300],
            ),
            height: 200,
            width: 180,
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.pie_chart,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  'Going to the gym',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                )
              ],
            ),),
          const SizedBox(
            width: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.yellow[400],
            ),
            height: 200,
            width: 180,
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.pie_chart,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  'Drink more water',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
