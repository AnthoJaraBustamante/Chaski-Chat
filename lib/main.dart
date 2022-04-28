import 'package:chat_take_home_test/app/routes/routes.dart';
import 'package:chat_take_home_test/app/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chaski Chat',
      initialRoute: AppRoutes.splash,
      routes: routes,
      theme: AppTheme.darkThemeData,
      darkTheme: AppTheme.darkThemeData,
    );
  }
}
