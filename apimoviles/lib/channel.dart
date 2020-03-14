import 'package:apimoviles/controller/ActivitiesController.dart';
import 'package:apimoviles/controller/AdvertisementController.dart';
import 'package:apimoviles/controller/CommentActivityController.dart';
import 'package:apimoviles/controller/CommentAdvertisementController.dart';
import 'package:apimoviles/controller/CourseController.dart';
import 'package:apimoviles/controller/DeliveryController.dart';
import 'package:apimoviles/controller/ScheduleController.dart';
import 'package:apimoviles/controller/UserTypeController.dart';
import 'package:apimoviles/controller/UsersController.dart';
import 'package:apimoviles/model/Users.dart';
import 'package:aqueduct/managed_auth.dart';

import 'apimoviles.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class ApimovilesChannel extends ApplicationChannel {
  ManagedContext context; //conexion de la bd y pantallas
  AuthServer authServer; //referencia a oauht2.0
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
    final persistenStore = PostgreSQLPersistentStore.fromConnectionInfo("postgres", "admin", "192.168.1.76", 5432, "classroom_moviles");//ip del servidor
    context = ManagedContext(dataModel,persistenStore);

    final authStorage = ManagedAuthDelegate<Users>(context);
    authServer = AuthServer(authStorage);
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

       router.route("/usertype[/:idTipoUsuario]").link(() => Authorizer.bearer(authServer)).link( () => UserTypeController(context) );
       router.route("/users[/:idUsuario]").link(() => Authorizer.bearer(authServer)).link( () => UsersController(context, authServer) );

       router.route("/user[/:idUser/:password]").link(()=>UsersController(context,authServer));

       router.route("/shedule[/:idPrograma]").link(() => Authorizer.bearer(authServer)).link( () => ScheduleController(context) );
       router.route("/delivery[/:idEnvio]").link(() => Authorizer.bearer(authServer)).link( () => DeliveryController(context) );
       router.route("/course[/:idCurso]").link(() => Authorizer.bearer(authServer)).link( () => CourseController(context) );
       router.route("/commentadv[/:idComentarioAnuncio]").link(() => Authorizer.bearer(authServer)).link( () => CommentAdvertisementController(context) );
       router.route("/commentact[/:idComentarioActividad]").link(() => Authorizer.bearer(authServer)).link( () => CommentActivityController(context) );
       router.route("/advertisement[/:idAnuncio]").link(() => Authorizer.bearer(authServer)).link( () => AdvertisementController(context) );
       router.route("/activities[/:idActividad]").link(() => Authorizer.bearer(authServer)).link( () => ActivitiesController(context) );

    return router;
  }
}