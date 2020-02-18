import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/CommentAdvertisement.dart';
import 'package:apimoviles/model/Course.dart';

class Advertisement extends ManagedObject <tblAdvertisement> implements tblAdvertisement{

}

class tblAdvertisement {
  @primaryKey
  int id;

  String notice;
  DateTime datAdvertisement;

  @Relate (#fk3idcourse)
  Course idcourse;


  //constraint
  ManagedSet <CommentAdvertisement> fkadvertisement;



}