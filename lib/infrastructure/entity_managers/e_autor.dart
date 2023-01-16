import 'package:biblioteca_app/domain/entities/autor.dart';
import 'package:biblioteca_app/infrastructure/controllers/c_autor.dart';

// C: CREATE
Future insertAutorEntity({required Autor autor}) async {
  await insertAutor(json: autor.toJson());
}

// R: READ
Future<Autor> getAutorEntity({required String codigo}) async {
  return Autor.fromJson(await getAutor(codigo: codigo));
}
Future<List<Autor>> getAutorsEntity() async {
  return (await getAutores()).map((e) => Autor.fromJson(e)).toList();
}

// U: UPDATE
Future updateAutorEntity({required String codigo, required String field, required String newValue}) async {
  await updateAutor(codigo: codigo, field: field, newValue: newValue);
}

// D: DELETE
Future deleteAutorEntity({required String codigo}) async {
  await deleteAutor(codigo: codigo);
}
