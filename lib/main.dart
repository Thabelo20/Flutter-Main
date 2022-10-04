import 'package:flutter/material.dart';
import 'package:flutter_training/ui/login.dart';
import 'package:flutter_training/ui/home.dart';
import 'package:flutter_training/provider/user_provider.dart';
import 'package:flutter_training/ui/register.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Training',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => Login(),
          '/register': (context) => Register(),
          '/home': (context) => Home(),
        },
      ),
    );
  }
}
