import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_take_home_test/app/models/user.dart';
import 'package:chat_take_home_test/app/routes/routes.dart';
import 'package:chat_take_home_test/app/ui/global_widgets/close_app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RefreshController _refreshController = RefreshController();
    final List<User> users = [
      User(
        id: '1',
        name: 'Juan',
        email: 'juan@gmail.com',
        isOnline: true,
      ),
      User(
        id: '2',
        name: 'Pedro',
        email: 'pedro@gmail.com',
        isOnline: false,
      ),
      User(
        id: '3',
        name: 'Ana',
        email: 'ana@gmail.com',
        isOnline: true,
      ),
      User(
        id: '4',
        name: 'Maria',
        email: 'maria@gmail.com',
        isOnline: false,
      ),
      User(
        id: '4',
        name: 'Maria',
        email: 'maria@gmail.com',
        isOnline: false,
      ),
      User(
        id: '4',
        name: 'Maria',
        email: 'maria@gmail.com',
        isOnline: false,
      ),
      User(
        id: '4',
        name: 'Maria',
        email: 'maria@gmail.com',
        isOnline: false,
      ),
      User(
        id: '4',
        name: 'Maria',
        email: 'maria@gmail.com',
        isOnline: false,
      ),
      User(
        id: '4',
        name: 'Maria',
        email: 'maria@gmail.com',
        isOnline: false,
      ),
    ];
    return WillPopScope(
      onWillPop: () async {
        bool? exit = await closeApp(context);
        return exit!;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MY NAME'),
          leading: IconButton(
            splashRadius: 20,
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              splashRadius: 20,
              icon: const Icon(Icons.circle_rounded),
              //TODO si esta activo Colors.blue : Colors.red
              color: Colors.green,
              onPressed: () => null,
            ),
          ],
        ),
        body: SmartRefresher(
          physics: const BouncingScrollPhysics(),
          controller: _refreshController,
          onRefresh: _refreshUsers,
          enablePullDown: true,
          header: const WaterDropHeader(
            complete: Icon(Icons.check, color: Colors.green),
            failed: Icon(Icons.check, color: Colors.red),
            waterDropColor: Colors.white,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                const Text(' Online'),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return !users[index].isOnline
                        ? Container()
                        : UserTile(user: users[index]);
                  },
                ),
                const SizedBox(height: 5),
                const Text(' Offline'),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return users[index].isOnline
                        ? Container()
                        : UserTile(user: users[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _refreshUsers() {
    print('refresh');
  }
}

class UserTile extends StatelessWidget {
  const UserTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: user.isOnline ? Colors.green : Colors.red,
        child: AutoSizeText(
          user.name.substring(0, 2).toUpperCase(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () => Navigator.pushNamed(context, AppRoutes.chat),
    );
  }
}
