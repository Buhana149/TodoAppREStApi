import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('lib/images/intro1.png'),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Manage all your tasks, calendar with CheckBox',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
              ),
              
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('This app will help you to manage your time better! Click bellow to start your adventure!',
              style: TextStyle(
                fontSize: 20,
              ),),
            ),
            GestureDetector(
              onTap: () {} ,
              child: Container(
                width: 400,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: BorderRadius.circular(5)),
                child: const Center(child: Text('Next', 
                style: TextStyle(color: Colors.white),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
