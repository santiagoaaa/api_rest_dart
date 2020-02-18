import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Course.dart';
import 'package:apimoviles/model/Users.dart';

class Schedule extends ManagedObject<tblShedule> implements tblShedule {
  
}

class tblShedule {
  @primaryKey
  int id;

  @Relate (#fkidcourse)
  Course idcourse;

  @Relate (#fkidstudent)
  Users idstudent;


}