import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"), backgroundColor: Colors.blueAccent,
        ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Santi: "), 
              accountEmail: Text("santi@gmail.com"),
              currentAccountPicture: CircleAvatar(
                 backgroundImage: new NetworkImage("http://i.pravatar.cc/300"),
                ),
              ),
              ListTile(
                title: Text("Cursos"),
                leading: Icon(Icons.golf_course),
                trailing: Icon(Icons.arrow_right),
                onTap: (){
                  Navigator.pushNamed(context, '/course');
                },
              ),
          ],
        ),
      ),
      ),
    );
  }
  
}