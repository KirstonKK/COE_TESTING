import 'dart:io';

import 'package:flutter/material.dart';
import '../ui/shop_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime _lastQuitTime = DateTime(0);

  Future<bool> _backTwice() async {
    if (_lastQuitTime == null ||
        DateTime.now().difference(_lastQuitTime).inSeconds > 1) {
      print('Press again Back Button exit');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Press back button again to exit')));
      _lastQuitTime = DateTime.now();
      return false;
    } else {
      print('sign out');
      Navigator.of(context).pop(exit(0));
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _backTwice,
        child: new Scaffold(
            body: new Container(
                color: Color(0xff00eaff),
                alignment: Alignment.center,
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Icon(
                        Icons.shopping_cart_rounded,
                        size: 250.0,
                      ),
                      new Text(
                        "instaShop",
                        style: new TextStyle(
                          fontSize: 50.0,
                        ),
                      ),
                      new ElevatedButton(
                          child: new Text("Sign in"),
                          onPressed: () {
                            var router = new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new SignInPage());

                            Navigator.of(context).push(router);
                          }),
                      new Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0)),
                      new Text(
                        "New to instaShop?",
                        style: new TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      new ElevatedButton(
                          child: new Text("Create new account"),
                          onPressed: () {
                            var router = new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new NewAccountPage());

                            Navigator.of(context).push(router);
                          }),
                    ]))));
  }
}

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _emailController = TextEditingController();
    var _passwordController = TextEditingController();
    return new Scaffold(
      backgroundColor: Color(0xff00eaff),
      body: new ListView(
        padding: EdgeInsets.all(40.0),
        children: <Widget>[
          new Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              //   mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0)),
                new Icon(Icons.shopping_cart_rounded, size: 140.0),
                new Text(
                  "Welcome back!",
                  style: new TextStyle(fontSize: 30),
                ),
                new Text("Please sign in to continue"),
                new TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: new InputDecoration(
                    labelText: "Email",
                  ),
                ),
                new TextField(
                  controller: _passwordController,
                  decoration: new InputDecoration(
                    labelText: "Password",
                  ),
                  obscureText: true,
                ),
                new TextButton(
                    onPressed: () => debugPrint("Forgot password pressed"),
                    child: new Text("Forgot your password?")),
                new ElevatedButton(
                    child: new Text("Sign in"),
                    onPressed: () {
                      var router = new MaterialPageRoute(
                          builder: (BuildContext context) => new ShopPage());
                      Navigator.of(context).push(router);
                    }),
                new TextButton(
                  onPressed: () {
                    var router = new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new NewAccountPage());
                    Navigator.of(context).push(router);
                  },
                  child: new Text("Don't have an account? Sign up"),
                ),
              ])
        ],
      ),
    );
  }
}

class NewAccountPage extends StatefulWidget {
  const NewAccountPage({Key? key}) : super(key: key);

  @override
  _NewAccountPageState createState() => _NewAccountPageState();
}

class _NewAccountPageState extends State<NewAccountPage> {
  @override
  Widget build(BuildContext context) {
    var _emailController = TextEditingController();
    var _passwordController = TextEditingController();
    var _secondPasswordController = TextEditingController();
    var _firstNameController = TextEditingController();
    var _lastNameController = TextEditingController();

    return new Scaffold(
      backgroundColor: Color(0xff00eaff),
      body: new ListView(
        padding: EdgeInsets.all(40.0),
        children: <Widget>[
          new Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              //   mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0)),
                new Icon(Icons.shopping_cart_rounded, size: 140.0),
                new Text(
                  "Welcome!",
                  style: new TextStyle(fontSize: 30),
                ),
                new Text("Fill in with your details to create account"),
                new TextField(
                  controller: _firstNameController,
                  decoration: new InputDecoration(
                    labelText: "First Name",
                  ),
                ),
                new TextField(
                  controller: _lastNameController,
                  decoration: new InputDecoration(
                    labelText: "Last Name",
                  ),
                ),
                new TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: new InputDecoration(
                    labelText: "Email",
                  ),
                ),
                new TextField(
                  controller: _passwordController,
                  decoration: new InputDecoration(
                    labelText: "Password (6 or more characters)",
                  ),
                  obscureText: true,
                ),
                new TextField(
                  controller: _secondPasswordController,
                  decoration: new InputDecoration(
                    labelText: "Confirm password",
                  ),
                  obscureText: true,
                ),
                new Padding(padding: EdgeInsets.all(10.0)),
                new ElevatedButton(
                    child: new Text("Create account"),
                    onPressed: () {
                      var router = new MaterialPageRoute(
                          builder: (BuildContext context) => new ShopPage());
                      Navigator.of(context).push(router);
                    }),
                new TextButton(
                  onPressed: () {
                    var router = new MaterialPageRoute(
                        builder: (BuildContext context) => new SignInPage());
                    Navigator.of(context).push(router);
                  },
                  child: new Text("Already have an account? Sign in"),
                ),
              ])
        ],
      ),
    );
  }
}
