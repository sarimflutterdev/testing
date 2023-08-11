import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:testing_build/Admin/FeedBack/FeedBackView.dart';
import 'package:testing_build/Admin/Plant/AddPlant.dart';
import 'package:testing_build/Admin/Plant/FetchPlant.dart';
import 'package:testing_build/Admin/SiteMap/SiteMapDetail.dart';
import 'package:testing_build/Admin/Users/AddUser.dart';
import 'package:testing_build/Admin/Users/FetchUser.dart';
import 'package:testing_build/reusable_widget/colors.dart';
import 'package:testing_build/reusable_widget/text_widget.dart';

import '../LoginScreen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {

  int selected_page = 0;

  void _pageshifter(int index){
    setState(() {
      selected_page = index;
    });
  }

  final List<Widget> page = [
    UserFetch(),
    PLantFetch(),
    ViewFeedBack(),
    DetailSiteMap()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[selected_page],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: GNav(
          tabBackgroundColor: MyColors.background_color.withOpacity(0.4),
          activeColor: MyColors.heading_color,
          gap: 6,
          curve: Curves.easeInExpo,
          selectedIndex: selected_page,
          onTabChange: _pageshifter,
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 14),
          tabs: [
            GButton(
                text: "Users",
                icon: Icons.person),
            GButton(
                text: "Plants",
                icon: Icons.energy_savings_leaf),
            GButton(
                text: "FeedBack",
                icon: Icons.feedback),
            GButton(
                text: "SiteMap",
                icon: Icons.place),
          ],
        ),
      ),
    );
  }
}


