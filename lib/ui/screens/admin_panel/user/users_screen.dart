import 'package:crm_flutter/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
          bottom:  TabBar(
            dividerColor: AppColors.grayishBlue.withOpacity(0.1),
            indicatorColor: AppColors.blue,
            labelColor: Colors.blue,
            tabs: const [
              Tab(text: 'All users'),
              Tab(text: 'Students'),
              Tab(text: 'Teachers'),
              Tab(text: 'Admins'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Content for Tab 1')),
            Center(child: Text('Content for Tab 2')),
            Center(child: Text('Content for Tab 3')),
            Center(child: Text('Content for Tab 4')),
          ],
        ),
      ),
    );
  }
}
