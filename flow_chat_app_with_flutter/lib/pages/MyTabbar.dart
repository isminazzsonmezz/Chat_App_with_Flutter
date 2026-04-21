import 'package:flow_chat_app_with_flutter/pages/Calls.dart';
import 'package:flow_chat_app_with_flutter/pages/ChatPages/Chats.dart';
import 'package:flow_chat_app_with_flutter/pages/Updates.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  @override
  Widget build(BuildContext context) {
    /*
      - length → Tab sayısı
      - TabBarView.children.length ile aynı olmak zorunda
    */
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: [
            Chats(),
            Updates(),
            Calls(),
          ],
        ),
        bottomNavigationBar: Material(
          color: Theme.of(context).appBarTheme.backgroundColor,
          child: TabBar(
            labelColor: Colors.blueGrey,
            indicatorColor: Colors.blueGrey,
            tabs: [
              Tab(
                icon: Icon(
                  FontAwesomeIcons.solidMessage,
                  color: Theme.of(context).appBarTheme.iconTheme?.color,
                ), text: "Chats"),
              Tab(
                icon: Icon(
                  FontAwesomeIcons.solidCalendar,
                  color: Theme.of(context).appBarTheme.iconTheme?.color,
                ), 
                text: "Updates",
              ),
              Tab(
                icon: Icon(
                  FontAwesomeIcons.phone,
                  color: Theme.of(context).appBarTheme.iconTheme?.color,
                ), text: "Calls"),
            ],
          ),
        ),
      ),
    );
  }
}
