import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:todoapp_restapi/components/colors.dart';
import 'package:todoapp_restapi/pages/add_page.dart';
import 'package:todoapp_restapi/pages/calendar_page.dart';
import 'package:todoapp_restapi/pages/first_page.dart';
import 'package:todoapp_restapi/pages/profile_page.dart';
import 'package:todoapp_restapi/pages/todo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    FirstPage(),
    TodoPage(),
    AddPage(),
    CalendarPage(),
    ProfilePage(),
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
        bottomNavigationBar: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: _navigateBottomBar,
            activeColor: secondaryColor,
            tabs: [
              GButton(
                icon: Icons.home,
                iconColor: Colors.grey[500],
                iconSize: 30,
              ),
              GButton(
                  icon: Icons.table_chart_sharp,
                  iconColor: Colors.grey[500],
                  iconSize: 30),
              GButton(
                  icon: Icons.add,
                  iconColor: Colors.grey[500],
                  backgroundColor: secondaryColor,
                  iconActiveColor: Colors.white,
                  iconSize: 40),
              GButton(
                  icon: Icons.calendar_month_rounded,
                  iconColor: Colors.grey[500],
                  iconSize: 30),
              GButton(
                  icon: Icons.person,
                  iconColor: Colors.grey[500],
                  iconSize: 30),
            ]),
            body: _pages[_selectedIndex],
        );
  }
}
