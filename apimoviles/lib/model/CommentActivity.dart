import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Activities.dart';
import 'package:apimoviles/model/Users.dart';

class CommentActivity extends ManagedObject <tblCommentActivity> implements tblCommentActivity {
  
}
class tblCommentActivity {
  @primaryKey
  int id;
  String comment;
  DateTime datComActivity;

  @Relate (#fk2activiti)
  Activities idactiviti;
  @Relate (#fk3idstudent)
  Users idstudent;
}