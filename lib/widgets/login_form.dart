import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _phoneNumber;
  String _password;

  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  Widget _buildphoneNumber() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Phone Number',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone Number is required';
        }
        return null;
      },
      onSaved: (String value) {
        _phoneNumber = value;
      },
    );
  }

  Widget _buildpassWord() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: 'Password',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Form(
        key: _loginKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildphoneNumber(),
            _buildpassWord(),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              width: 140,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.blueAccent,
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                onPressed: () {
                  if (!_loginKey.currentState.validate()) {
                    return;
                  }
                  _loginKey.currentState.save();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
