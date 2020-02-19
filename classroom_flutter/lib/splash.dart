import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

//void main() => runApp(Splash());

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashForm();
  }
  
}
class SplashForm extends State<Splash>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      /* routes: {
        '/login' :(context)=>Login(),
        '/splash':(context)=>Dashboard(),
        '/course':(context)=>Course(),
        
      },*/

      home: SplashScreen(
        seconds: 3,
        image: Image.network("https://www.pngkey.com/png/detail/19-192944_thanos-head-png-thanos-png.png"),
        //navigateAfterSeconds: Login(),
        title: Text("Welcome to Class", 
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
         gradientBackground: new LinearGradient(colors: [Colors.white, Colors.green], begin: Alignment.center, end: Alignment.bottomCenter),
      
      )
    );
  }

}