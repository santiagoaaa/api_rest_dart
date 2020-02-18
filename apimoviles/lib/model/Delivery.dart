import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Activities.dart';
import 'package:apimoviles/model/Users.dart';

class Delivery extends ManagedObject <tblDelivery> implements tblDelivery  {
  
}

class tblDelivery {
  @primaryKey 
  int id;

  String file;
  DateTime datDelivery;

  @Relate(#fk2idstudent)
  Users idstudent;
  @Relate(#fkactiviti)
  Activities idactiviti;
}