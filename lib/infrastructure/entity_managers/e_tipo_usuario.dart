import 'package:biblioteca_app/domain/entities/tipo_usuario.dart';
import 'package:biblioteca_app/infrastructure/controllers/c_tipo_usuario.dart';

// C: CREATE
Future insertTipoUsuarioEntity({required TipoUsuario tipoUsuario}) async {
  await insertTipoUsuario(json: tipoUsuario.toJson());
}

// R: READ
Future<TipoUsuario> getTipoUsuarioEntity({required String codigo}) async {
  return TipoUsuario.fromJson(await getTipoUsuario(codigo: codigo));
}
Future<List<TipoUsuario>> getTipoUsuariosEntity() async {
  return (await getTipoUsuarios()).map((e) => TipoUsuario.fromJson(e)).toList();
}

// U: UPDATE
Future updateTipoUsuarioEntity({required String codigo, required String field, required String newValue}) async {
  await updateTipoUsuario(codigo: codigo, field: field, newValue: newValue);
}

// D: DELETE
Future deleteTipoUsuarioEntity({required String codigo}) async {
  await deleteTipoUsuario(codigo: codigo);
}
