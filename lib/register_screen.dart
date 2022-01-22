import 'dart:convert';
import 'package:api_flutter/constants.dart';
import 'package:http/http.dart' as http;
import 'package:api_flutter/form_fields.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API'),
      ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              FormFields(signIn: false),
              SizedBox(height: 20),
              Text(
                map["register"]!,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  child: Text("Register"),
                  onPressed: () {
                    setState(() {
                      register();
                    });
                  }),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  void register() async {
    Map data = {
      "name": map["name"],
      "email": map["email"],
      "phone": map["phone"],
      "city": map["city"],
      "state": map["state"],
      "country": map["country"],
      "password": map["password"],
      "cpassword": map["cpassword"]
    };

    String body = json.encode(data);

    var url = Uri.parse(
        'https://signin-signup-userregistration.herokuapp.com/signup');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    var jsonResponse = json.decode(response.body);
    if (response.statusCode >= 200 && response.statusCode <= 400) {
      print(jsonResponse['message']);
      setState(() {
        map["register"] = jsonResponse['message'];
      });
    } else {
      print(jsonResponse['error']);
      setState(() {
        map["register"] = jsonResponse['error'];
      });
    }
  }
}
