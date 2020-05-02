import 'package:flutter/material.dart';
import 'main.dart';
import 'model/drink_item.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  bool _rememberMe = false;

  Widget _buildFirstName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'First Name',
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
              prefixIcon: Icon(Icons.person, color: Colors.black),
              hintText: 'Enter your First Name',
              //hintStyle: kHintTextStyle,
            ),
          ),
          
        ),
        
      ],
    );
  }
  
  Widget _buildLastName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Last Name',
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
              prefixIcon: Icon(Icons.person, color: Colors.black),
              hintText: 'Enter your Last Name',
              //hintStyle: kHintTextStyle,
            ),
          ),
          
        ),
        
      ],
    );
  }

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
              hintText: 'Enter your New Password',
              //hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

Widget _buildPasswordConfirmation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Confirm Password',
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
              hintText: 'Confirm your New Password',
              //hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
 

  

  Widget _buildLogInButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation:
            5.0, //here is to make it look higher than the others like it was above
        onPressed: () async{ 
         List<FoodItem>foodItemsList = await foodItems();
          Navigator.push(context,
               MaterialPageRoute(builder: (context) => Home(foodItemsList)));
               print('Login Button Pressed');       ////HERE IS THE NAVEGATION TO OTHER PAGES
        },//print('Login Button Pressed'),
        padding: EdgeInsets.all(15.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.white,
        child: Text(
          'SIGN UP',
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
                  Text('Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans', // change the font
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 30.0),
                  _buildFirstName(),
                  SizedBox(height: 30.0),
                  _buildLastName(),
                  SizedBox(height: 30.0),
                  _buildEmail(),
                  SizedBox(height: 30.0),
                  _buildPassword(),
                  SizedBox(height: 30.0),
                  _buildPasswordConfirmation(),
                  SizedBox(height: 30.0),
                  _buildLogInButton(),
                ]),
          ),
        )
      ]),
    );
  }
}

