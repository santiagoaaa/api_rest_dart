import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Activities.dart';
import 'package:apimoviles/model/Advertisement.dart';
import 'package:apimoviles/model/Schedule.dart';
import 'package:apimoviles/model/Users.dart';


class Course extends ManagedObject <tblCourse> implements tblCourse {
  
}

class tblCourse {
  @primaryKey
  int id;

  String name;
  String description;

  @Relate (#fkiduser)
  Users idteacher; //match de id del maestro

//Constraint
  ManagedSet <Schedule> fkidcourse;
  ManagedSet <Activities> fk2idcourse;

  ManagedSet <Advertisement> fk3idcourse;
}