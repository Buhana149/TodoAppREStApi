import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/font_sizes.dart';

class SliverBox2 extends StatelessWidget {
  const SliverBox2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Active Projects',
              style: medium,
            ),
          ),
          Row(
            children: [
               Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightBlue[300],
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
                      'Learning History',
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
                  color: Colors.red[300],
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
                      'Medical App',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
