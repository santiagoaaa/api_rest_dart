import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/CommentActivity.dart';
import 'package:apimoviles/model/Course.dart';
import 'package:apimoviles/model/Delivery.dart';

class Activities extends ManagedObject <tblActivities> implements tblActivities{

}

class tblActivities {
  @primaryKey
  int id;

  String activity;
  String description;
  DateTime datActivity;

  @Relate(#fk2idcourse)
  Course idcourse;

  //Contraint
  ManagedSet <Delivery> fkactiviti;
  ManagedSet <CommentActivity> fk2activiti;
  
}