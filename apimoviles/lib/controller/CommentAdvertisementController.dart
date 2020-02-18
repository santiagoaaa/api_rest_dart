import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/CommentAdvertisement.dart';

class CommentAdvertisementController extends ResourceController {

  final ManagedContext context;
  CommentAdvertisementController (this.context);

//Esto es un select *
  @Operation.get()
  Future <Response> getCommentAdvertisement() async {
    final CommentAdvertisementQuery = Query <CommentAdvertisement>(context);
    final resCommentAdvertisement = await CommentAdvertisementQuery.fetch();
    return Response.ok(resCommentAdvertisement);
  }

  @Operation.get('idComentarioAnuncio')
  Future <Response> getComentarioAnuncioById (@Bind.path('idComentarioAnuncio') int idAct) async {
    final CommentAdvertisementQuery = Query<CommentAdvertisement>(context)..where((a)=>a.id).equalTo(idAct);
    final restCommentAdvertisement = await CommentAdvertisementQuery.fetch();
    return Response.ok(restCommentAdvertisement);
  }

  @Operation.post()
  Future <Response> insComentarioAnuncio() async{
    final objComentarioAnuncio = CommentAdvertisement()..read(await request.body.decode());
    final query = Query<CommentAdvertisement>(context)..values=objComentarioAnuncio;
    final insComentarioAnuncio = await query.insert();
    return Response.ok(insComentarioAnuncio);
  }

  @Operation.put('idComentarioAnuncio')
  Future<Response> upComentarioAnuncio(@Bind.path('idComentarioAnuncio') int idAct) async{
    final objComentarioAnuncio = CommentAdvertisement()..read(await request.body.decode());
    final queryComentarioAnuncio = Query<CommentAdvertisement>(context)..where((a)=>a.id).equalTo(idAct)..values = objComentarioAnuncio;

    final upComentarioAnuncio = await queryComentarioAnuncio.updateOne();
    return Response.ok(upComentarioAnuncio);
  }

  @Operation.delete('idComentarioAnuncio')
  Future <Response> delComentarioAnuncio (@Bind.path('idComentarioAnuncio') int idAct) async{
    final queryComentarioAnuncio = Query<CommentAdvertisement>(context)..where((a)=>a.id).equalTo(idAct);

    final delComentarioAnuncio = await queryComentarioAnuncio.delete();
    return Response.ok(delComentarioAnuncio);
  }
}
