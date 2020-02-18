import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/UserType.dart';

class UserTypeController extends ResourceController {

  final ManagedContext context;
  UserTypeController (this.context);

//Esto es un select *
  @Operation.get()
  Future <Response> getUserType() async {
    final UserTypeQuery = Query <UserType>(context);
    final resUserType = await UserTypeQuery.fetch();
    return Response.ok(resUserType);
  }

  @Operation.get('idTipoUsuario')
  Future <Response> getTipoUsuarioById (@Bind.path('idTipoUsuario') int idAct) async {
    final UserTypeQuery = Query<UserType>(context)..where((a)=>a.id).equalTo(idAct);
    final restUserType = await UserTypeQuery.fetch();
    return Response.ok(restUserType);
  }

  @Operation.post()
  Future <Response> insTipoUsuario() async{
    final objTipoUsuario = UserType()..read(await request.body.decode());
    final query = Query<UserType>(context)..values=objTipoUsuario;
    final insTipoUsuario = await query.insert();
    return Response.ok(insTipoUsuario);
  }

  @Operation.put('idTipoUsuario')
  Future<Response> upTipoUsuario(@Bind.path('idTipoUsuario') int idAct) async{
    final objTipoUsuario = UserType()..read(await request.body.decode());
    final queryTipoUsuario = Query<UserType>(context)..where((a)=>a.id).equalTo(idAct)..values = objTipoUsuario;

    final upTipoUsuario = await queryTipoUsuario.updateOne();
    return Response.ok(upTipoUsuario);
  }

  @Operation.delete('idTipoUsuario')
  Future <Response> delTipoUsuario (@Bind.path('idTipoUsuario') int idAct) async{
    final queryTipoUsuario = Query<UserType>(context)..where((a)=>a.id).equalTo(idAct);

    final delTipoUsuario = await queryTipoUsuario.delete();
    return Response.ok(delTipoUsuario);
  }
}
