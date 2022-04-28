import 'package:chat_take_home_test/app/ui/pages/chat_page/chat_page.dart';
import 'package:chat_take_home_test/app/ui/pages/login_page/login_page.dart';
import 'package:chat_take_home_test/app/ui/pages/register_page/register_page.dart';
import 'package:chat_take_home_test/app/ui/pages/splash_page/splash_page.dart';
import 'package:chat_take_home_test/app/ui/pages/user_page/user_page.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  AppRoutes.user: (_) => const UserPage(),
  AppRoutes.splash: (_) => const SplashPage(),
  AppRoutes.login: (_) => const LoginPage(),
  AppRoutes.register: (_) => const RegisterPage(),
  AppRoutes.chat: (_) => const ChatPage(),
};

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String user = '/user';
  static const String chat = '/chat';
}
