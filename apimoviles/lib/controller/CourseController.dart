import 'package:apimoviles/apimoviles.dart';
import 'package:apimoviles/model/Course.dart';

class CourseController extends ResourceController {

  final ManagedContext context;
  CourseController (this.context);

//Esto es un select *
  @Operation.get()
  Future <Response> getCourse() async {
    final CourseQuery = Query <Course>(context);
    final resCourse = await CourseQuery.fetch();
    return Response.ok(resCourse);
  }

  @Operation.get('idCurso')
  Future <Response> getCursoById (@Bind.path('idCurso') int idCur) async {
    final CourseQuery = Query<Course>(context)..where((a)=>a.id).equalTo(idCur);
    final restCourse = await CourseQuery.fetch();
    return Response.ok(restCourse);
  }

  @Operation.post()
  Future <Response> insCurso() async{
    final objCurso = Course()..read(await request.body.decode());
    final query = Query<Course>(context)..values=objCurso;
    final insCurso = await query.insert();
    return Response.ok(insCurso);
  }

  @Operation.put('idCurso')
  Future<Response> upCurso(@Bind.path('idCurso') int idCur) async{
    final objCurso = Course()..read(await request.body.decode());
    final queryCurso = Query<Course>(context)..where((a)=>a.id).equalTo(idCur)..values = objCurso;

    final upCurso = await queryCurso.updateOne();
    return Response.ok(upCurso);
  }

  @Operation.delete('idCurso')
  Future <Response> delCurso (@Bind.path('idCurso') int idCur) async{
    final queryCurso = Query<Course>(context)..where((a)=>a.id).equalTo(idCur);

    final delCurso = await queryCurso.delete();
    return Response.ok(delCurso);
  }
}
