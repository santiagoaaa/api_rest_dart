import 'package:classroom_flutter/MisPreferencias.dart';
import 'package:flutter/material.dart';


class Dashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashboardState();
  }

}

class DashboardState extends State<Dashboard>{
 MisPreferencias _misPreferencias = MisPreferencias();


  @override
  void initState(){
    super.initState();
    _misPreferencias.init().then((value){
      setState(() {
        _misPreferencias = value;
      });
    });
  }

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
              ListTile(
                title: Text("No mantener sesión"),
                leading: Icon(Icons.exit_to_app),
                trailing: Icon(Icons.arrow_right),
                onTap: (){
                  print("Cerrando sesion...");
                  _misPreferencias.estatus = false;
                  _misPreferencias.token="";
                  _misPreferencias.commit();
                },
              ),
          ],
        ),
      ),
      ),
    );
  }
  
}