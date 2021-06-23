import 'package:flutter/material.dart';
import 'package:task3_app/global.dart';
import 'package:task3_app/main.dart';
import 'package:task3_app/RazorPayFile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'Welcome to the home page $inputName',
                style: TextStyle(fontSize: 30),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Rozor()));
                },
                child: Text("Click for RazorPay"))
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                '$inputName',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: Text("Payment history"),
              leading: IconButton(
                icon: Icon(Icons.history_sharp),
                onPressed: () {},
              ),
            ),
            ListTile(
              title: Text("Help & Support"),
              leading: IconButton(icon: Icon(Icons.help), onPressed: () {}),
            ),
            ListTile(
              title: Text("Refer a friend"),
              leading:
                  IconButton(icon: Icon(Icons.person_add), onPressed: () {}),
            ),
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  return showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: new Text('Log Out'),
                      content: new Text('Are you sure to logout?'),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text('Yes'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyApp()));
                          },
                        )
                      ],
                    ),
                  );
                },
              ),
              title: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

Route _createRouteRazor() {
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
