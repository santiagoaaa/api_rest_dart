import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Schedule.dart';

class ScheduleController extends ResourceController {

  final ManagedContext context;
  ScheduleController (this.context);

//Esto es un select *
  @Operation.get()
  Future <Response> getSchedule() async {
    final ScheduleQuery = Query <Schedule>(context);
    final resSchedule = await ScheduleQuery.fetch();
    return Response.ok(resSchedule);
  }

  @Operation.get('idPrograma')
  Future <Response> getProgramaById (@Bind.path('idPrograma') int idPro) async {
    final ScheduleQuery = Query<Schedule>(context)..where((a)=>a.id).equalTo(idPro);
    final restSchedule = await ScheduleQuery.fetch();
    return Response.ok(restSchedule);
  }

  @Operation.post()
  Future <Response> insPrograma() async{
    final objPrograma = Schedule()..read(await request.body.decode());
    final query = Query<Schedule>(context)..values=objPrograma;
    final insPrograma = await query.insert();
    return Response.ok(insPrograma);
  }

  @Operation.put('idPrograma')
  Future<Response> upPrograma(@Bind.path('idPrograma') int idPro) async{
    final objPrograma = Schedule()..read(await request.body.decode());
    final queryPrograma = Query<Schedule>(context)..where((a)=>a.id).equalTo(idPro)..values = objPrograma;

    final upPrograma = await queryPrograma.updateOne();
    return Response.ok(upPrograma);
  }

  @Operation.delete('idPrograma')
  Future <Response> delPrograma (@Bind.path('idPrograma') int idPro) async{
    final queryPrograma = Query<Schedule>(context)..where((a)=>a.id).equalTo(idPro);
    final delPrograma = await queryPrograma.delete();
    return Response.ok(delPrograma);
  }
}
