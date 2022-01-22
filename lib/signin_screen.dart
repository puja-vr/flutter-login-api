import 'dart:convert';
import 'package:api_flutter/constants.dart';
import 'package:http/http.dart' as http;
import 'package:api_flutter/form_fields.dart';
import 'package:api_flutter/register_screen.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool signIn = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10),
            FormFields(signIn: true),
            SizedBox(height: 20),
            Text(
              map["signin"]!,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            ElevatedButton(
                child: Text("Sign In"),
                onPressed: () {
                  setState(() {
                    signin();
                  });
                }),
            SizedBox(height: 20),
            TextButton(
              onPressed: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Register())),
              child: RichText(
                text: TextSpan(
                  text: 'Don\'t have an account?',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' Sign up',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void signin() async {
    Map data = {"email": map["email"], "password": map["password"]};

    String body = json.encode(data);

    var url =
        Uri.parse('https://signin-signup-userregistration.herokuapp.com/login');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    var jsonResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      print(jsonResponse['message']);
      setState(() {
        map["signin"] = jsonResponse['message'];
      });
    } else {
      print(jsonResponse['error']);
      setState(() {
        map["signin"] = jsonResponse['error'];
      });
    }
  }
}
