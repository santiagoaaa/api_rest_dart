import 'package:apimoviles/controller/ActivitiesController.dart';
import 'package:apimoviles/controller/AdvertisementController.dart';
import 'package:apimoviles/controller/CommentActivityController.dart';
import 'package:apimoviles/controller/CommentAdvertisementController.dart';
import 'package:apimoviles/controller/CourseController.dart';
import 'package:apimoviles/controller/DeliveryController.dart';
import 'package:apimoviles/controller/ScheduleController.dart';
import 'package:apimoviles/controller/UserTypeController.dart';
import 'package:apimoviles/controller/UsersController.dart';

import 'apimoviles.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class ApimovilesChannel extends ApplicationChannel {
  ManagedContext context;
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistenStore = PostgreSQLPersistentStore.fromConnectionInfo("postgres", "admin", "192.168.1.65", 5432, "classroom_moviles");//ip del servidor
    context = ManagedContext(dataModel,persistenStore);
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/

       router.route("/usertype[/:idTipoUsuario]").link( () => UserTypeController(context) );
       router.route("/users[/:idUsuario]").link( () => UsersController(context) );
       router.route("/shedule[/:idPrograma]").link( () => ScheduleController(context) );
       router.route("/delivery[/:idEnvio]").link( () => DeliveryController(context) );
       router.route("/course[/:idCurso]").link( () => CourseController(context) );
       router.route("/commentadv[/:idComentarioAnuncio]").link( () => CommentAdvertisementController(context) );
       router.route("/commentact[/:idComentarioActividad]").link( () => CommentActivityController(context) );
       router.route("/advertisement[/:idAnuncio]").link( () => AdvertisementController(context) );
       router.route("/activities[/:idActividad]").link( () => ActivitiesController(context) );

    return router;
  }
}