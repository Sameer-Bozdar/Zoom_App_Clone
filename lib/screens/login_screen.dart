import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zoom_clone/resources/authMethods.dart';
import 'package:zoom_clone/screens/navbarScreen.dart';
import 'package:zoom_clone/widgets/customButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreebState();
}

class _LoginScreebState extends State<LoginScreen> {
  final AuthMethod _authMethod = AuthMethod();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Start or join a meeting",
            style: TextStyle(color: Colors.white, fontSize: 24),
          )),
          SizedBox(
            height: 40,
          ),
          Image.asset(
            "assets/images/onboarding.jpg",
          ),
          SizedBox(
            height: 30,
          ),
          CustomButton(
              title: "Google sign in",
              onTap: () async {
                 bool res = await _authMethod.googleSignIn(context);

                if (res) {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => HomeScreen())));
                }
              })
        ],
      ),
    );
  }
}
