import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:pagination/services/api.dart';
import 'package:pagination/widgets/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email'),
                          validator: (val) =>
                              !EmailValidator.validate(val, true)
                                  ? 'Not a valid email.'
                                  : null,
                          onSaved: (val) => email = val,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password'),
                          validator: (val) => val.length == null
                              ? 'Password too short..'
                              : null,
                          onSaved: (val) => password = val,
                          obscureText: true,
                        ),
                        RaisedButton(
                          color: Colors.green,
                          onPressed: () {
                            _submit();
                          },
                          child: Text('Sign in'),
                        ),
                      ],
                    ))
              ],
            )),
      ),
    );
  }

  void _submit() async {
    final form = formKey.currentState;
    if (form.validate()) {
      //SharedPreferences prefs = await SharedPreferences.getInstance();
      form.save();
      var r = await loginData(email, password);
      print("R = $r");

      if (r == true) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    }
  }
}
