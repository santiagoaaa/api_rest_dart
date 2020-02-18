import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/CommentActivity.dart';

class CommentActivityController extends ResourceController {

  final ManagedContext context;
  CommentActivityController (this.context);

//Esto es un select *
  @Operation.get()
  Future <Response> getCommentActivity() async {
    final CommentActivityQuery = Query <CommentActivity>(context);
    final resCommentActivity = await CommentActivityQuery.fetch();
    return Response.ok(resCommentActivity);
  }

  @Operation.get('idComentarioActividad')
  Future <Response> getComentarioActividadById (@Bind.path('idComentarioActividad') int idAct) async {
    final CommentActivityQuery = Query<CommentActivity>(context)..where((a)=>a.id).equalTo(idAct);
    final restCommentActivity = await CommentActivityQuery.fetch();
    return Response.ok(restCommentActivity);
  }

  @Operation.post()
  Future <Response> insComentarioActividad() async{
    final objComentarioActividad = CommentActivity()..read(await request.body.decode());
    final query = Query<CommentActivity>(context)..values=objComentarioActividad;
    final insComentarioActividad = await query.insert();
    return Response.ok(insComentarioActividad);
  }

  @Operation.put('idComentarioActividad')
  Future<Response> upComentarioActividad(@Bind.path('idComentarioActividad') int idAct) async{
    final objComentarioActividad = CommentActivity()..read(await request.body.decode());
    final queryComentarioActividad = Query<CommentActivity>(context)..where((a)=>a.id).equalTo(idAct)..values = objComentarioActividad;

    final upComentarioActividad = await queryComentarioActividad.updateOne();
    return Response.ok(upComentarioActividad);
  }

  @Operation.delete('idComentarioActividad')
  Future <Response> delComentarioActividad (@Bind.path('idComentarioActividad') int idAct) async{
    final queryComentarioActividad = Query<CommentActivity>(context)..where((a)=>a.id).equalTo(idAct);

    final delComentarioActividad = await queryComentarioActividad.delete();
    return Response.ok(delComentarioActividad);
  }
}
