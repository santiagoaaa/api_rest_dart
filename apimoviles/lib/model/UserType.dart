import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Users.dart';

class UserType extends ManagedObject <tblUserType> implements tblUserType{

}

class tblUserType {
  @primaryKey
  int id;

  @Column(unique:true)
  String description;

  //en esta parte definimos que sera llave de otra tabla
  ManagedSet <Users> fktypuser; //con fktypuser definimos el nombre de la relacion

 
}