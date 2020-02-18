import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Advertisement.dart';

class AdvertisementController extends ResourceController {
  final ManagedContext context;
  AdvertisementController (this.context);

  @Operation.get()
  Future <Response> getAdvertisement() async {
    final advertisementQuery = Query <Advertisement>(context);
    final resAdvertisement = await advertisementQuery.fetch();
    return Response.ok(resAdvertisement);
  }

   @Operation.get('idAnuncio')
  Future <Response> getAnuncioById (@Bind.path('idAnuncio') int idAnun) async {
    final anuncioQuery = Query<Advertisement>(context)..where((a)=>a.id).equalTo(idAnun);
    final restAnuncio = await anuncioQuery.fetch();
    return Response.ok(restAnuncio);
  }

  @Operation.post()
  Future <Response> insAnuncio() async{
    final objAnuncio = Advertisement()..read(await request.body.decode());
    final query = Query<Advertisement>(context)..values=objAnuncio;
    final insAnuncio = await query.insert();
    return Response.ok(insAnuncio);
  }

  @Operation.put('idAnuncio')
  Future<Response> upAnuncio(@Bind.path('idAnuncio') int idAnun) async{
    final objAnuncio = Advertisement()..read(await request.body.decode());
    final queryAnuncio = Query <Advertisement>(context)..where((a)=>a.id).equalTo(idAnun)..values = objAnuncio;

    final upAnuncio = await queryAnuncio.updateOne();
    return Response.ok(upAnuncio);
  }

  @Operation.delete('idAnuncio')
  Future <Response> delAnuncio (@Bind.path('idAnuncio') int idAnun) async{
    final queryAnuncio = Query<Advertisement>(context)..where((a)=>a.id).equalTo(idAnun);

    final delAnuncio = await queryAnuncio.delete();
    return Response.ok(delAnuncio);
  }

  
}