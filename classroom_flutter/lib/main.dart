import 'package:classroom_flutter/MisPreferencias.dart';
import 'package:classroom_flutter/dashboard.dart';
import 'package:classroom_flutter/cursos.dart';
import 'package:classroom_flutter/login.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(Splash());

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashForm();
  }
  
}
class SplashForm extends State<Splash>{
  MisPreferencias _misPreferencias = MisPreferencias();
  @override
  void initState(){
    super.initState();
    _misPreferencias.init().then((value){
      setState(() {
        print("init ");
        _misPreferencias = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
      
      int estado=0;
      print("Estado");
      print(_misPreferencias.estatus);

      if (_misPreferencias.estatus == true) {
        print("splach SI presiono");
            return MaterialApp(
              routes: {
                '/login' :(context)=>Login(),
                '/dash':(context)=>Dashboard(),
                '/course':(context)=>Cursos(),
              },

              home: SplashScreen(
                seconds: 3,
                image: Image.network("https://cdn3.iconfinder.com/data/icons/education-flat-icon-1/130/135-512.png"),
                navigateAfterSeconds: Dashboard(),
                title: Text("Welcome to the jungle", 
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                gradientBackground: new LinearGradient(colors: [Colors.white, Colors.green], begin: Alignment.center, end: Alignment.bottomCenter),
              
              )
            );
      } else {
        _misPreferencias.estatus = false;
        _misPreferencias.commit();

        print("Splash NO presiono");
            return MaterialApp(
              routes: {
                '/login' :(context)=>Login(),
                '/dash':(context)=>Dashboard(),
                '/course':(context)=>Cursos(),
                
              },

              home: SplashScreen(
                seconds: 3,
                image: Image.network("https://cdn3.iconfinder.com/data/icons/education-flat-icon-1/130/135-512.png"),
                navigateAfterSeconds: Login(),
                title: Text("Welcome to Class", 
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                gradientBackground: new LinearGradient(colors: [Colors.white, Colors.green], begin: Alignment.center, end: Alignment.bottomCenter),
              
              )
            );
      }
    // TODO: implement build

  }

}