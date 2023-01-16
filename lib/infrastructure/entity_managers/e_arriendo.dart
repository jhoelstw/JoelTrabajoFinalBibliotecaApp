import 'package:biblioteca_app/domain/entities/arriendo.dart';
import 'package:biblioteca_app/infrastructure/controllers/c_arriendo.dart';

// C: CREATE
Future insertArriendoEntity({required Arriendo arriendo}) async {
  await insertArriendo(json: arriendo.toJson());
}

// R: READ
Future<Arriendo> getArriendoEntity({required String codigo}) async {
  return Arriendo.fromJson(await getArriendo(codigo: codigo));
}
Future<List<Arriendo>> getArriendosEntity() async {
  return (await getArriendos()).map((e) => Arriendo.fromJson(e)).toList();
}

// U: UPDATE
Future updateArriendoEntity({required String codigo, required String field, required String newValue}) async {
  await updateArriendo(codigo: codigo, field: field, newValue: newValue);
}

// D: DELETE
Future deleteArriendoEntity({required String codigo}) async {
  await deleteArriendo(codigo: codigo);
}
