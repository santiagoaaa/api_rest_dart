import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Delivery.dart';

class DeliveryController extends ResourceController {

  final ManagedContext context;
  DeliveryController (this.context);

//Esto es un select *
  @Operation.get()
  Future <Response> getDelivery() async {
    final DeliveryQuery = Query <Delivery>(context);
    final resDelivery = await DeliveryQuery.fetch();
    return Response.ok(resDelivery);
  }

  @Operation.get('idEnvio')
  Future <Response> getEnvioById (@Bind.path('idEnvio') int idEnv) async {
    final DeliveryQuery = Query<Delivery>(context)..where((a)=>a.id).equalTo(idEnv);
    final restDelivery = await DeliveryQuery.fetch();
    return Response.ok(restDelivery);
  }

  @Operation.post()
  Future <Response> insEnvio() async{
    final objEnvio = Delivery()..read(await request.body.decode());
    final query = Query<Delivery>(context)..values=objEnvio;
    final insEnvio = await query.insert();
    return Response.ok(insEnvio);
  }

  @Operation.put('idEnvio')
  Future<Response> upEnvio(@Bind.path('idEnvio') int idEnv) async{
    final objEnvio = Delivery()..read(await request.body.decode());
    final queryEnvio = Query<Delivery>(context)..where((a)=>a.id).equalTo(idEnv)..values = objEnvio;

    final upEnvio = await queryEnvio.updateOne();
    return Response.ok(upEnvio);
  }

  @Operation.delete('idEnvio')
  Future <Response> delEnvio (@Bind.path('idEnvio') int idEnv) async{
    final queryEnvio = Query<Delivery>(context)..where((a)=>a.id).equalTo(idEnv);

    final delEnvio = await queryEnvio.delete();
    return Response.ok(delEnvio);
  }
}
