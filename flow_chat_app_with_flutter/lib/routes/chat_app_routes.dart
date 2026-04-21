import 'package:flow_chat_app_with_flutter/pages/ChatPages/ChatDetail.dart';
import 'package:flow_chat_app_with_flutter/pages/ChatPages/ProfileDetail.dart';
import 'package:flow_chat_app_with_flutter/pages/Help.dart';
import 'package:flow_chat_app_with_flutter/pages/LoginPages/Login.dart';
import 'package:flow_chat_app_with_flutter/pages/LoginPages/Register.dart';
import 'package:flow_chat_app_with_flutter/pages/MyTabbar.dart';
import 'package:flow_chat_app_with_flutter/pages/Settings.dart';
import 'package:flutter/material.dart';

class ChatAppRoutes {
  static const login = '/login';
  static const register = '/register';
  static const setting = '/setting';
  static const help = '/help';
  static const chats = '/chats';
  static const chatDetail = '/chatDetail';
  static const profileDetail = "/profileDetail";

  static Map<String, WidgetBuilder> routes = {
    login: (context) => Login(),
    register: (context) => Register(),
    setting: (context) => Settings(),
    help: (context) => Help(),
    chats: (context) => MyTabBar(), // TabBar'daki Chats page..
    chatDetail: (context) => ChatDetail(),
    profileDetail: (context) => ProfileDetail(),
  };
}
