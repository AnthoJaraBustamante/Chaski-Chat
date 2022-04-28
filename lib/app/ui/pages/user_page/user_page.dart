import 'package:chat_take_home_test/app/ui/global_widgets/close_app_dialog.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool? exit = await closeApp(context);
        return exit!;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('UserPage'),
        ),
        body: SafeArea(
          child: Text('UserController'),
        ),
      ),
    );
  }
}
