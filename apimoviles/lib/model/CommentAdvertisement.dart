import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Advertisement.dart';
import 'package:apimoviles/model/Users.dart';

class CommentAdvertisement extends ManagedObject <tblCommentAdvertisement> implements tblCommentAdvertisement {
  
}

class tblCommentAdvertisement {
  @primaryKey
  int id;

  String comment;
  DateTime datComAdvertisement;

  @Relate (#fkadvertisement)
  Advertisement idadvertisement;
  @Relate (#fk4idstudent)
  Users idstudent;
}