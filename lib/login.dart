import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var currentState = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Colors.white,

            // Status bar brightness (optional)
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(
              0, MediaQuery.of(context).size.height * 0.15, 0, 0),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Image(
                        image: AssetImage('assets/FinalAppLogo.png'),
                      ),
                    ],
                  )),
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width * 0.90,
                child: Column(children: <Widget>[
                  TextField(
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.052,
                        fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFE5E5E5),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(
                            MediaQuery.of(context).size.width * 0.025)),
                        borderSide: const BorderSide(
                            color: Color(0xFFE5E5E5), width: 0.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(
                            MediaQuery.of(context).size.width * 0.025)),
                        borderSide: const BorderSide(
                            color: Color(0xFFE5E5E5), width: 0.0),
                      ),
                      hintText: 'Username',
                      hintStyle: const TextStyle(color: Colors.black),
                      contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.055),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.045),
                  TextField(
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.052,
                        fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFE5E5E5),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(
                            MediaQuery.of(context).size.width * 0.025)),
                        borderSide: const BorderSide(
                            color: Color(0xFFE5E5E5), width: 0.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(
                            MediaQuery.of(context).size.width * 0.025)),
                        borderSide: const BorderSide(
                            color: Color(0xFFE5E5E5), width: 0.0),
                      ),
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Colors.black),
                      contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.055),
                    ),
                  ),
                ]),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(
                          MediaQuery.of(context).size.width * 0.025)),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      color: const Color(0xFFE5E5E5)),
                  child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                      ),
                      child: Text(
                        currentState == 'login' ? 'Sign up' : 'Log in',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: MediaQuery.of(context).size.width * 0.05),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/homeRoute');
                      }))
            ],
          ),
        ),
        bottomSheet: Container(
          height: MediaQuery.of(context).size.height * 0.11,
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(
              0, 0, 0, MediaQuery.of(context).size.height * 0.04),
          child: Column(children: <Widget>[
            Divider(
                thickness: MediaQuery.of(context).size.width * 0.001,
                color: Colors.black,
                indent: MediaQuery.of(context).size.width * 0.07,
                endIndent: MediaQuery.of(context).size.width * 0.07),
            Container(
                padding: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).size.height * 0.01, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      currentState == 'login'
                          ? 'Already have an account?'
                          : 'Don’t  have an account?',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery.of(context).size.width * 0.047),
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            if (currentState == 'login') {
                              currentState = 'signup';
                            } else
                              currentState = 'login';
                          });
                        },
                        child: (Text(
                          currentState == 'login' ? ' Log in' : ' Sign up',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.047,
                              color: Colors.blue),
                        )))
                  ],
                ))
          ]),
        ));
  }
}
