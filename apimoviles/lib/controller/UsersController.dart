import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Users.dart';

class UsersController extends ResourceController {

  final ManagedContext context;
  final AuthServer authServer;
  UsersController (this.context, this.authServer);

//Esto es un select *
  @Operation.get()
  Future <Response> getUsers() async {
    final UsersQuery = Query <Users>(context);
    final resUsers = await UsersQuery.fetch();
    return Response.ok(resUsers);
  }

  @Operation.get('idUser','password')
    Future<Response> loginUser(@Bind.path('idUser') String usuario,
    @Bind.path('password') String pwd ) async {

    String token = "";
    try {
      final autenticado = await authServer.authenticate(usuario, pwd, "com.classroom.flutter","");
      token = autenticado.accessToken;
      return Response.ok(token);
    } catch (e) {
    return Response.forbidden(body: {"error": "las credenciales no son validas"});
    }
  }
/*
  @Operation.get('idUsuario')
  Future <Response> getUsuarioById (@Bind.path('idUsuario') int idUs) async {
    final UsersQuery = Query<Users>(context)..where((a)=>a.id).equalTo(idUs);
    final restUsers = await UsersQuery.fetch();
    return Response.ok(restUsers);
  }
*/
/*
  @Operation.post()
  Future <Response> insUsuario() async{
    final objUsuario = Users()..read(await request.body.decode());
    final query = Query<Users>(context)..values=objUsuario;
    final insUsuario = await query.insert();
    return Response.ok(insUsuario);
  }
*/
  @Operation.post()
  Future<Response> insUsers(@Bind.body() Users user) async {
    // Check for required parameters before we spend time hashing
    if (user.username == null || user.password == null) {
      return Response.badRequest(
        body: {"error": "username and password required."});
    }

    user
      ..salt = AuthUtility.generateRandomSalt()
      ..hashedPassword = authServer.hashPassword(user.password, user.salt);

    return Response.ok(await Query(context, values: user).insert());
  }

  @Operation.put('idUsuario')
  Future<Response> upUsuario(@Bind.path('idUsuario') int idUs) async{
    final objUsuario = Users()..read(await request.body.decode());
    final queryUsuario = Query<Users>(context)..where((a)=>a.id).equalTo(idUs)..values = objUsuario;

    final upUsuario = await queryUsuario.updateOne();
    return Response.ok(upUsuario);
  }

  @Operation.delete('idUsuario')
  Future <Response> delUsuario (@Bind.path('idUsuario') int idUs) async{
    final queryUsuario = Query<Users>(context)..where((a)=>a.id).equalTo(idUs);

    final delUsuario = await queryUsuario.delete();
    return Response.ok(delUsuario);
  }

  /*prueba*/
  
}
