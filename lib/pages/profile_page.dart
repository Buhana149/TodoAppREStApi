import 'package:flutter/material.dart';
import 'package:todoapp_restapi/components/colors.dart';
import 'package:todoapp_restapi/pages/drawer_page.dart';
import 'package:todoapp_restapi/ui_helpers/profile_page_ui/appbar_ui.dart';
import 'package:todoapp_restapi/ui_helpers/profile_page_ui/my_tasks_sliverbox.dart';
import 'package:todoapp_restapi/ui_helpers/profile_page_ui/active_projects_sliverbar.dart';
import 'package:todoapp_restapi/ui_helpers/profile_page_ui/sliver_box_3.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: primaryColor,
      drawer: const DrawerPage(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            backgroundColor: secondaryColor,
            title: const AppbarUi(),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )
            ),
          ),
         const SliverToBoxAdapter(
          child: Column(
            children: [
              MyTasksSliverbox(),
              ActiveProjectsSliverbar(),
              ListOfTasks(),
            ],
          ),
         )
        ],
      ),
    );
}
