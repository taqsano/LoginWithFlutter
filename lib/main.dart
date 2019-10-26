import 'package:b5/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPass = false;
  TextEditingController _userControl = new TextEditingController();
  TextEditingController _passControl = new TextEditingController();
  var _errUser = "At less 5 character";
  var _errPass = "At less 6 character";
  var _validUser = true;
  var _validPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: AlignmentDirectional.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      width: 70,
                      height: 70,
                      padding: EdgeInsets.all(15),
                      child: FlutterLogo()),
                ),
              ),
              Container(
                alignment: AlignmentDirectional.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Text(
                    "Login Page",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: TextField(
                  style: TextStyle(fontSize: 22, color: Colors.blue),
                  controller: _userControl,
                  decoration: InputDecoration(
                      labelText: "USERNAME",
                      errorText: _validUser ? null : _errUser,
                      errorStyle: TextStyle(fontSize: 15),
                      labelStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    TextField(
                      style: TextStyle(fontSize: 22, color: Colors.blue),
                      obscureText: !_showPass,
                      controller: _passControl,
                      decoration: InputDecoration(
                          labelText: "PASSWORD",
                          errorText: _validPass ? null : _errPass,
                          errorStyle: TextStyle(fontSize: 15),
                          labelStyle: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ),
                    GestureDetector(
                      onTap: ToggleShowPass,
                      child: Text(
                        _showPass ? "HIDE" : "SHOW",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: RaisedButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      onPressed: LoginClick,
                      child: Text(
                        "Log In",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ],
          ),
        ),
      );
  }

  void ToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void LoginClick() {
    setState(() {
      if (_userControl.text.length < 6 ) {
        _validUser = false;
      } else {
        _validUser = true;
      }

      if (_passControl.text.length < 6) {
        _validPass = false;
      } else {
        _validPass = true;
      }

      if(_validUser == true && _validPass == true){
        Navigator.push(context, MaterialPageRoute(builder: routesHome));
      }
    });
  }
  Widget routesHome (BuildContext context){
    return HomePage();
  }
}
 