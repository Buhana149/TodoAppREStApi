import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                      style: TextStyle(
                        fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 120,
                    ),
                    Text('View Calendar'),
                    Icon(Icons.arrow_forward_ios, size: 15,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
