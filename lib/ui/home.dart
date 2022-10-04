import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/contact_api.dart';
import '../provider/user_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    Contacts response = await getContacts(context: context);
  }

  logOut() {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);

    userProvider.email = "";
    userProvider.password = "";
    userProvider.token = "";

    Navigator.of(context).pushNamedAndRemoveUntil("/login", (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, actions: [
        TextButton(
          onPressed: () {
            logOut();
          },
          child: Text(
            'Log Out',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ]),
      body: Container(
        padding: EdgeInsets.only(
          top: 20,
          bottom: 20,
        ),
        alignment: Alignment.topCenter,
        child: Text(
          "WELCOME ${userProvider.email!.toUpperCase()}",
        ),
      ),
    );
  }
}
