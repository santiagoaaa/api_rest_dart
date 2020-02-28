import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final txtUserController = TextEditingController();
    final txtPwdController = TextEditingController();
     
      Future<int> validateUser() async{
      var usr = txtUserController.text;
      var pwd = txtPwdController.text;
      
      http.Response response = await http
      .get(
        Uri.encodeFull("http://192.168.1.71:8888/users/"),
        headers: { "Accept" : "application/json"}
      );

      var token = response.body; // Obtener el token de la peticion o el error
      return response.statusCode;
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

      final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async {
          Navigator.pushReplacementNamed(context, '/dash');
          /*
          var codigo = await validateUser();
          //print(codigo);
          if( codigo == 200 ){
            //Navigator.push(context, MaterialPageRoute(builder:(context)=>Dashboard()));
            Navigator.pushReplacementNamed(context, '/dash');
          }else{
             Navigator.pushReplacementNamed(context, '/dash');
            showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  title: Text("Mensaje de la APP"),
                  content: Text("Error al Autenticarse"),
                  actions: <Widget>[
                    new FlatButton(
                      child: Text("Cerrar"),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              }
            );
          }*/
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
              loginButton
            ],
          ),
        ),
      //),
    );
  }
}