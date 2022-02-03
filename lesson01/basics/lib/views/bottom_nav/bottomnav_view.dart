import 'package:counter/views/bottom_nav/notifications_view.dart';
import 'package:counter/views/bottom_nav/profile_view.dart';
import 'package:counter/views/bottom_nav/home_view.dart';
import 'package:flutter/material.dart';

class BottomNavigationView extends StatefulWidget {
  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  List<Widget> views = [HomeView(), NotificationsView(), ProfileView()];
  int viewIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigation'),
      ),
      // body: ,
      // bottomNavigationBar: ,
    );
  }
}
