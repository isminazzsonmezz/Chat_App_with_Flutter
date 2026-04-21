import 'package:flow_chat_app_with_flutter/pages/ChatPages/ChatDetail.dart';
import 'package:flow_chat_app_with_flutter/pages/ChatPages/ProfileDetail.dart';
import 'package:flow_chat_app_with_flutter/pages/Help.dart';
import 'package:flow_chat_app_with_flutter/pages/LoginPages/Login.dart';
import 'package:flow_chat_app_with_flutter/pages/LoginPages/Register.dart';
import 'package:flow_chat_app_with_flutter/pages/MyTabbar.dart';
import 'package:flow_chat_app_with_flutter/pages/Settings.dart';
import 'package:flow_chat_app_with_flutter/routes/chat_app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ChatAppRoutes.login,
      routes: {
        ChatAppRoutes.login: (_) => Login(),
        ChatAppRoutes.register: (_) => Register(),
        ChatAppRoutes.setting: (_) => Settings(),
        ChatAppRoutes.chats: (_) => MyTabBar(),
        ChatAppRoutes.chatDetail: (_) => ChatDetail(),
        ChatAppRoutes.help: (_) => Help(),
        ChatAppRoutes.profileDetail: (_) => ProfileDetail(),
      },
      title: 'Flow Chat App',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      //home: MyTabBar(),
    );
  }
}

