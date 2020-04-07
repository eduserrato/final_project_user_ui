import 'package:flutter/material.dart';
import 'main.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  Widget _buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(color: Colors.white),
          //style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          //decoration: kBoxDecorationStyle,
          color: Colors.white,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black), // color in the box
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(Icons.email, color: Colors.black),
              hintText: 'Enter your Email',
              //hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(color: Colors.white),
          //style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          //decoration: kBoxDecorationStyle,
          color: Colors.white,
          height: 60.0,
          child: TextField(
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black), //color in the box
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(Icons.lock, color: Colors.black),
              hintText: 'Enter your Password',
              //hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordButton() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
          onPressed: () => print('Forgot Password Button Pressed'),
          padding: EdgeInsets.only(right: 0.0),
          child: Text(
            'Forgot Password?',
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  Widget _buildRememberMeCheckBox() {
    return Container(
        height: 20.0,
        child: Row(
          children: <Widget>[
            Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                  value: _rememberMe,
                  checkColor: Colors.purple,
                  activeColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value;
                    });
                  }),
            ),
            Text(
              'Remember me',
              style: TextStyle(color: Colors.white),
            )
          ],
        ));
  }

  Widget _buildLogInButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation:
            5.0, //here is to make it look higher than the others like it was above
        onPressed: () =>  Navigator.push(context,
              MaterialPageRoute(builder: (context) => Home())),//print('Login Button Pressed'),
        padding: EdgeInsets.all(15.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFFBA55D3),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xFFEE82EE),
                Color(0xFFDDA0DD),
                Color(0xFFDA70D6),
                Color(0xFFBA55D3),
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            ))),
        Container(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 120.0,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans', // change the font
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 30.0),
                  _buildEmail(),
                  SizedBox(height: 30.0),
                  _buildPassword(),
                  _buildForgotPasswordButton(),
                  _buildRememberMeCheckBox(),
                  _buildLogInButton(),
                ]),
          ),
        )
      ]),
    );
  }
}
