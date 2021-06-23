import 'package:flutter/material.dart';
import 'package:task3_app/global.dart';
import 'package:task3_app/HomeScreenApp.dart';

class SRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: REGISTER(),
    );
  }
}

class REGISTER extends StatefulWidget {
  @override
  _Register createState() => _Register();
}

class _Register extends State<REGISTER> {
  TextEditingController displayName = new TextEditingController();
  TextEditingController emailId = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                //width: 200,
                margin: EdgeInsets.all(40),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/images/registerLogo.png',
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: 1000,
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: displayName,
                  autocorrect: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.teal,
                      ),
                      hintText: 'Display Name',
                      hintStyle: TextStyle(color: Colors.blueAccent),
                      filled: true,
                      fillColor: Colors.white70,
                      //icon: Icon(Icons.person),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.teal, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.teal),
                      )),
                ),
              ),
              Container(
                width: 1000,
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: emailId,
                  autocorrect: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.teal,
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.blueAccent),
                      filled: true,
                      fillColor: Colors.white70,
                      //icon: Icon(Icons.person),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.teal, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.teal),
                      )),
                ),
              ),
              Container(
                width: 1000,
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  obscureText: true,
                  obscuringCharacter: "*",
                  //autocorrect: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.teal,
                      ),
                      hintText: 'Password',
                      suffixText: '*',
                      hintStyle: TextStyle(color: Colors.blueAccent),
                      filled: true,
                      fillColor: Colors.white70,
                      //icon: Icon(Icons.person),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.teal, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.teal),
                      )),
                ),
              ),
              Container(
                width: 1000,
                height: 50,
                margin: EdgeInsets.all(50),
                child: Container(
                  child: ElevatedButton(
                    onPressed: () {
                      inputName = displayName.text;
                      inputEmail = emailId.text;
                      Navigator.of(context).push(_createRouteHome());
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Create Account",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Route _createRouteHome() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
