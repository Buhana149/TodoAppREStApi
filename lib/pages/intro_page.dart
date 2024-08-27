import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/button.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('lib/images/intro1.png'),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Manage all your tasks, calendar with CheckBox',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'This app will help you to manage your time better! Click bellow to start your adventure!',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            MyButton(
              text: 'Next',
              onTap: () {
                Navigator.pushNamed(context, '/homepage');
              },
            )
          ],
        ),
      ),
    );
}
