import 'package:api_flutter/constants.dart';
import 'package:flutter/material.dart';

class FormFields extends StatefulWidget {
  final bool signIn;
  FormFields({required this.signIn});

  @override
  _FormFieldsState createState() => _FormFieldsState(signIn: signIn);
}

class _FormFieldsState extends State<FormFields> {
  final bool signIn;
  _FormFieldsState({required this.signIn});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: signIn
          ? Column(
              children: <Widget>[
                buildEmailFormField(),
                SizedBox(height: 10),
                buildPasswordFormField("password"),
                SizedBox(height: 10),
              ],
            )
          : Column(
              children: <Widget>[
                buildTextFormField("name"),
                SizedBox(height: 10),
                buildPhoneFormField(),
                SizedBox(height: 10),
                buildTextFormField("city"),
                SizedBox(height: 10),
                buildTextFormField("state"),
                SizedBox(height: 10),
                buildTextFormField("country"),
                SizedBox(height: 10),
                buildEmailFormField(),
                SizedBox(height: 10),
                buildPasswordFormField("password"),
                SizedBox(height: 10),
                buildPasswordFormField("cpassword"),
                SizedBox(height: 10),
              ],
            ),
    );
  }

  TextFormField buildPasswordFormField(String text) {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => map[text] = newValue!,
      onChanged: (value) {
        setState(() => map[text] = value);
      },
      decoration: InputDecoration(
        labelText: text.toUpperCase(),
        fillColor: Colors.white70,
        filled: true,
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => map["email"] = newValue!,
      textInputAction: TextInputAction.next,
      onChanged: (value) {
        setState(() => map["email"] = value);
      },
      decoration: InputDecoration(
        labelText: "EMAIL",
        fillColor: Colors.white70,
        filled: true,
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => map["phone"] = newValue!,
      textInputAction: TextInputAction.next,
      onChanged: (value) {
        setState(() => map["phone"] = value);
      },
      decoration: InputDecoration(
        labelText: "PHONE",
        fillColor: Colors.white70,
        filled: true,
      ),
    );
  }

  TextFormField buildTextFormField(String text) {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => map[text] = newValue!,
      textInputAction: TextInputAction.next,
      onChanged: (value) {
        setState(() => map[text] = value);
      },
      decoration: InputDecoration(
        labelText: text.toUpperCase(),
        fillColor: Colors.white70,
        filled: true,
      ),
    );
  }
}
