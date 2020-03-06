import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//void main() => runApp(Splash());

class Cursos extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CursosForm();
  }
}

class CursosForm extends State<Cursos> {
  List dataCursos;
  var isloading = false;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtDesc = TextEditingController();
  
  Future <String> getCursos() async{
    this.setState((){
      isloading = true;
    });

    var response =  await http.get(
      Uri.encodeFull("http://10.188.105.219:8888/course"),
      headers: { "Accept" : "application/json"}
    );

    this.setState((){
      dataCursos = json.decode(response.body);
      isloading =false;
    });
  }

  @override
  void initState(){
    getCursos();
  }


  Future <int> insCurso() async{
    this.setState((){
      isloading = true;
    });

    var name = txtName.text;
    var desc = txtDesc.text;

    Map<String, String> headers  = {"Content-type":"application/json"};
    String cadJson = '{"name":"$name", "description":"$desc","idteacher":{"id":3}}';

    var response = await http.post(
      Uri.encodeFull("http://10.188.105.219:8888/course"),
      headers: headers,
      body: cadJson
    );

    var response2 = await http.get(
      Uri.encodeFull("http://10.188.105.219:8888/course"),
      headers: {"Accept":"application/json"}
    );

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //getCursos();
    return MaterialApp(
     
      home:Scaffold(
        appBar: AppBar(
          title: Text("Cursos"),
          backgroundColor: Colors.blueAccent,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_circle),
          onPressed: (){
            showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  title: Text("Nuevo curso"),
                  content: Form(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          controller: txtName,
                          decoration: InputDecoration(hintText: 'Nombre del curso'),
                        ),
                        TextField(
                          controller: txtDesc,
                          decoration: InputDecoration(hintText: 'Descripcion del curso'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: RaisedButton(
                            child: Text("Guardar curso"),
                            onPressed: (){
                              //Mas acciones
                              var code = insCurso();
                              Navigator.pop(context);
                              
                            },
                          ),
                        )
                      ],
                    )
                  ),
                );
              }
            );
            //codigo del boton
          },
        ),
        body: isloading ? Center(child: CircularProgressIndicator())
        :ListView.builder(
            itemCount: dataCursos == null ? 0 : dataCursos.length, //si es 0 regresa null sino length
             itemBuilder: (BuildContext context, int index){
                return Slidable(
                   actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  child: Card(
                    elevation: 8.0,
                    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                    child: Container(
                      decoration: BoxDecoration(color: Color.fromRGBO(121, 181, 237, .9)),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                        leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: BoxDecoration(
                              border: Border( right: BorderSide(width: 1.0, color: Colors.black))
                            ),
                            child: Icon(Icons.language, color: Colors.black)
                          ),
                        
                          title: Text(
                              dataCursos[index]['name'],
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),

                          subtitle: Row(
                            children: <Widget>[
                              //Icon(Icons.touch_app, color: Colors.yellowAccent),
                              Text(dataCursos[index]['description'], style: TextStyle(color: Colors.black))
                            ],
                          ),

                          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0,),
                        ),
                      ),
                  ),
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'Edit',
                      color: Colors.lightGreenAccent,
                      icon: Icons.edit,
                      //onTap: () => _showSnackBar('More'),
                    ),
                    IconSlideAction(
                      caption: 'Delete',
                      color: Colors.red,
                      icon: Icons.delete,
                      //onTap: () => _showSnackBar('Delete'),
                    ),
                  ],
                );
             },
          )
      ),
    );
  }
}