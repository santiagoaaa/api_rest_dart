import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration2 extends Migration { 
  @override
  Future upgrade() async {
   		database.alterColumn("tblActivities", "idcourse", (c) {c.isUnique = false;});
		database.alterColumn("tblAdvertisement", "idcourse", (c) {c.isUnique = false;});
		database.alterColumn("tblCommentActivity", "idactiviti", (c) {c.isUnique = false;});
		database.alterColumn("tblCommentActivity", "idstudent", (c) {c.isUnique = false;});
		database.alterColumn("tblCommentAdvertisement", "idadvertisement", (c) {c.isUnique = false;});
		database.alterColumn("tblCommentAdvertisement", "idstudent", (c) {c.isUnique = false;});
		database.alterColumn("tblDelivery", "idstudent", (c) {c.isUnique = false;});
		database.alterColumn("tblDelivery", "idactiviti", (c) {c.isUnique = false;});
		database.alterColumn("tblShedule", "idstudent", (c) {c.isUnique = false;});
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    