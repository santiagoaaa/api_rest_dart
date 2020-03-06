import 'package:classroom_flutter/MisPreferencias.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }

}


class LoginState extends State<Login> {
  MisPreferencias _misPreferencias = MisPreferencias();
  
  final txtUserController = TextEditingController();
  final txtPwdController = TextEditingController();
  bool checkValue = false;


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
      Future<int> validateUser() async{
      var usr = txtUserController.text;
      var pwd = txtPwdController.text;
    }

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.lightGreen,
        radius: 48.0,
        child: Image.network("http://i.pravatar.cc/300"),//Image.asset("imagenes/logo.png")
      ),
    );

    final txtUser = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: txtUserController,//hace referencia al elemento txt de arriba
      decoration: InputDecoration(
        hintText: 'Introduce tu correo',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );  

    final txtPwd = TextFormField(
      controller: txtPwdController,//hace referencia al elemento txt de arriba
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Introduce contraseña',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );   

    final chBox =  Checkbox(
      value: _misPreferencias.estatus, 
      onChanged: (value){
        print(value);
        print("---");
        setState((){
          //manda el value del estatus, pero sin guardar
          _misPreferencias.estatus = value;
          checkValue = value;
          print(checkValue);
          //_misPreferencias.commit();
        });
      },
     // title: new Text("Matener sesión iniciada"),
      activeColor: Colors.green,
    );


      final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async {
          _misPreferencias.commit();
            Navigator.pushReplacementNamed(context, '/dash');
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlue,
        child: Text('Entrar', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      //title: "Iniciar sesión",
     // home: Scaffold(
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 90),
              txtUser,
              SizedBox(height: 30),
              txtPwd,
              SizedBox(height: 30),
              loginButton,
              SizedBox(height: 15),
              new Text('Mantener sesión iniciada', textAlign:TextAlign.center,),
              chBox,
  
              
              
            ],
          ),
        ),
      //),
    );
  }
}