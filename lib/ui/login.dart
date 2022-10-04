import 'package:flutter/material.dart';
import 'package:flutter_training/api/login_api.dart';
import 'package:flutter_training/provider/user_provider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

// This is the login page.
class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isBusy = false;

  logIn() async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);

    setState(() {
      isBusy = true;
    });

    UserSignInResponse response = await userSignIn(
      context: context,
      request: UserSignInRequest(
        userEmail: email.text.trim().toLowerCase(),
        userPassword: password.text.trim(),
      ),
    );

    setState(() {
      isBusy = false;
    });

    if (response.auth! == "Not authorized" || response.auth!.isEmpty) {
      AlertDialog(
        title: Text(
          "Login Failed",
        ),
        content: Text(
          'Login attempt has failed. Please check your email and password.',
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      );
    } else {
      userProvider.email = email.text.trim().toLowerCase();
      userProvider.password = email.text.trim();
      userProvider.token = response.auth!;

      Navigator.of(context).pushNamedAndRemoveUntil("/home", (_) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isBusy == true
          ? SizedBox(
              height: MediaQuery.of(context).size.height / 1.3,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              color: Colors.blueGrey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 40,
                      top: 70,
                    ),
                    child: Text(
                      'Welcome\nBack',
                      style: TextStyle(
                        fontSize: 35,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 40,
                      right: 40,
                      top: 40,
                    ),
                    child: Column(children: [
                      TextField(
                        controller: email,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sign In',
                          ),
                          CircleAvatar(
                            radius: 30,
                            child: IconButton(
                              onPressed: () async {
                                logIn();
                              },
                              icon: Icon(
                                Icons.arrow_forward,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Not yet a registered user?',
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("/register");
                            },
                            child: Text(
                              'Register',
                            ),
                          )
                        ],
                      ),
                    ]),
                  ),
                ],
              ),
            ),
    );
  }
}
