import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Activities.dart';

class ActivitiesController extends ResourceController {

  final ManagedContext context;
  ActivitiesController (this.context);

//Esto es un select *
  @Operation.get()
  Future <Response> getActivities() async {
    final activitiesQuery = Query <Activities>(context);
    final resActivities = await activitiesQuery.fetch();
    return Response.ok(resActivities);
  }

  @Operation.get('idActividad')
  Future <Response> getActividadById (@Bind.path('idActividad') int idAct) async {
    final activitiesQuery = Query<Activities>(context)..where((a)=>a.id).equalTo(idAct);
    final restActivities = await activitiesQuery.fetch();
    return Response.ok(restActivities);
  }

  @Operation.post()
  Future <Response> insActividad() async{
    final objActividad = Activities()..read(await request.body.decode());
    final query = Query<Activities>(context)..values=objActividad;
    final insActividad = await query.insert();
    return Response.ok(insActividad);
  }

  @Operation.put('idActividad')
  Future<Response> upActividad(@Bind.path('idActividad') int idAct) async{
    final objActividad = Activities()..read(await request.body.decode());
    final queryActividad = Query<Activities>(context)..where((a)=>a.id).equalTo(idAct)..values = objActividad;

    final upActividad = await queryActividad.updateOne();
    return Response.ok(upActividad);
  }

  @Operation.delete('idActividad')
  Future <Response> delActividad (@Bind.path('idActividad') int idAct) async{
    final queryActividad = Query<Activities>(context)..where((a)=>a.id).equalTo(idAct);

    final delActividad = await queryActividad.delete();
    return Response.ok(delActividad);
  }
}
