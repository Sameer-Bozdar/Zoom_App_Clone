import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/authMethods.dart';
import 'package:zoom_clone/screens/history_screen.dart';
import 'package:zoom_clone/screens/meeting_screen.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/customButton.dart';
import 'package:zoom_clone/widgets/homeMeetingButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;

  pageindex(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> page = [
    MeetingScreen(),
    HistoryScreen(),
    Center(child: Text("Contacts")),
    Center(
      child: CustomButton(title: "Logout", onTap:() =>  AuthMethod().signOutUser
      
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // elevation: 1,
          title: Text(
            "Meet & Chat",
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: backgroundColor,
        ),
        body: page[_page],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _page,
            onTap: pageindex,
            unselectedFontSize: 14.0,
            backgroundColor: footerColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: "Meet & Chat",
                  backgroundColor: footerColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), label: "Messages"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.contacts), label: "Contacts"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Settings"),
            ]));
  }
}
