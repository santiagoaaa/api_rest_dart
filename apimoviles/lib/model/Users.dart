import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/CommentActivity.dart';
import 'package:apimoviles/model/CommentAdvertisement.dart';
import 'package:apimoviles/model/Delivery.dart';
import 'package:apimoviles/model/Schedule.dart';
import 'package:apimoviles/model/UserType.dart';
import 'package:apimoviles/model/Course.dart';
import 'package:aqueduct/managed_auth.dart';

class Users extends ManagedObject <tblUsers> implements tblUsers, ManagedAuthResourceOwner<tblUsers> {
  @Serialize (input: true, output:false)
  String password;

}

class tblUsers extends ResourceOwnerTableDefinition  {
  //@primaryKey
  //int id;

  String name;
  String lastName; 
  DateTime birDate; 
  //String password; 

  @Column(unique: true)
  String email; 

  @Relate (#fktypuser)//aqui hace match con el nombre que definio en UserType.dart
  UserType idType;

//constraint 
  ManagedSet <Course> fkiduser; //maestro en curso
  ManagedSet <Schedule> fkidstudent;
  ManagedSet <Delivery> fk2idstudent;
  ManagedSet <CommentActivity> fk3idstudent;
  ManagedSet <CommentAdvertisement> fk4idstudent;
}