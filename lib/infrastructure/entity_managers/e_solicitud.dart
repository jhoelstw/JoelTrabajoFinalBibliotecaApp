import 'package:biblioteca_app/domain/entities/solicitud.dart';
import 'package:biblioteca_app/infrastructure/controllers/c_solicitud.dart';

// C: CREATE
Future insertSolicitudEntity({required Solicitud solicitud}) async {
  await insertSolicitud(json: solicitud.toJson());
}

// R: READ
Future<Solicitud> getSolicitudEntity({required String codigo}) async {
  return Solicitud.fromJson(await getSolicitud(codigo: codigo));
}
Future<List<Solicitud>> getSolicitudsEntity() async {
  return (await getSolicituds()).map((e) => Solicitud.fromJson(e)).toList();
}

// U: UPDATE
Future updateSolicitudEntity({required String codigo, required String field, required String newValue}) async {
  await updateSolicitud(codigo: codigo, field: field, newValue: newValue);
}

// D: DELETE
Future deleteSolicitudEntity({required String codigo}) async {
  await deleteSolicitud(codigo: codigo);
}
