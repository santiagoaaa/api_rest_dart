
import 'package:shared_preferences/shared_preferences.dart';
class MisPreferencias {
  static final MisPreferencias instancia = MisPreferencias.internal();//cada que se llame a MisPreferencias va a devolver la instancia.
  

  //CLAVES
  static const LLAVE = "chkEstatus";
  //Campos a manejar
  SharedPreferences _sharedPreferences;//esta clase se encarga de leer y guardar configuraciones
  bool estatus = false;
  
  MisPreferencias.internal(){}

  factory MisPreferencias()=>instancia;
  
  //Lee las configuraciones
  Future <SharedPreferences> get preferencias async{
    if (_sharedPreferences != null) {
      return _sharedPreferences;
    } else {
      _sharedPreferences = await SharedPreferences.getInstance();
      estatus = _sharedPreferences.getBool(LLAVE);//lee la LLAVE llamada chkEstatus

      //si no encuentra una LLAVE, regresa estatus = null, entonces arreglamos eso asi...
      if (estatus==null) {
        estatus = false;
      }
      return _sharedPreferences;

    }
  }

  //Escribe las configuraciones
  Future <bool> commit ()async{
    await _sharedPreferences.setBool(LLAVE, estatus);
  }

  //incia todo
  Future <MisPreferencias> init () async{
    _sharedPreferences = await preferencias;
    return this;
  }

}