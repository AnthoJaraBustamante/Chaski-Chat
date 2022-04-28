import 'package:chat_take_home_test/app/routes/routes.dart';
import 'package:chat_take_home_test/app/ui/global_widgets/button.dart';
import 'package:chat_take_home_test/app/ui/global_widgets/close_app_dialog.dart';
import 'package:chat_take_home_test/app/ui/global_widgets/logo.dart';
import 'package:chat_take_home_test/app/ui/global_widgets/textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool? exit = await closeApp(context);
        return exit!;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SafeArea(child: SizedBox()),
              const LogoWidget(),
              const SizedBox(height: 20),
              const TitleLogo(),
              const SizedBox(height: 20),
              const RegularTextField(
                labelText: 'Email',
                icon: Icons.email,
              ),
              const SizedBox(height: 20),
              const RegularTextField(
                labelText: 'Password',
                icon: Icons.lock,
              ),
              const SizedBox(height: 35),
              RegularButton(
                text: 'Register',
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutes.chat, (route) => false),
              ),
              const SizedBox(height: 35),
              const Hero(
                tag: 'info_account_label',
                child: Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: Text('Already have an account?'),
                ),
              ),

              const SizedBox(height: 20),
              // const SizedBox(height: 5),
              // const SizedBox(height: 5),
              RegularButton(
                text: 'Login',
                onTap: () => Navigator.pushNamed(context, AppRoutes.login),
              ),
              const SafeArea(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
