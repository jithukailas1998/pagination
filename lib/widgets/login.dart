import 'package:awesome_page_transitions/awesome_page_transitions.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:pagination/services/api.dart';
import 'package:pagination/widgets/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String email;
  String password;
  int _loginValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.green,
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
                          validator: (val) =>
                              val.length == null ? 'Password too short..' : null,
                          onSaved: (val) => password = val,
                          obscureText: true,
                        ),
                        RaisedButton(
                          color: Colors.green,
                          onPressed: () {
                            _submit(0);
                          },
                          child: Text('Sign in'),
                        ),
                        // RaisedButton(
                        //   color: Colors.green,
                        //   onPressed: () {
                        //     Navigator.push(
                        //       context,
                        //       AwesomePageRoute(
                        //         transitionDuration: Duration(milliseconds: 600),
                        //         exitPage: widget,
                        //         enterPage: HomeScreen(),
                        //         transition: CubeTransition(),
                        //       ),
                        //     );
                        //   },
                        //   child: Text('go to home'),
                        // ),
                      ],
                    ))
              ],
            )),
      ),
    );
  }

  void _submit(int x) async {
    final form = formKey.currentState;
    if (form.validate()) {
      //SharedPreferences prefs = await SharedPreferences.getInstance();
      form.save();
          var r = await loginData(email, password);
          print("R = $r");

          if(r == true){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen ()),
              );

          }
    }
  }

}
