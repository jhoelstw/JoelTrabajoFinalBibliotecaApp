import 'package:biblioteca_app/domain/entities/libro.dart';
import 'package:biblioteca_app/infrastructure/controllers/c_libro.dart';

// C: CREATE
Future insertLibroEntity({required Libro libro}) async {
  await insertLibro(json: libro.toJson());
}

// R: READ
Future<Libro> getLibroEntity({required String codigo}) async {
  return Libro.fromJson(await getLibro(codigo: codigo));
}
Future<List<Libro>> getLibrosEntity() async {
  return (await getLibros()).map((e) => Libro.fromJson(e)).toList();
}

// U: UPDATE
Future updateLibroEntity({required String codigo, required String field, required String newValue}) async {
  await updateLibro(codigo: codigo, field: field, newValue: newValue);
}

// D: DELETE
Future deleteLibroEntity({required String codigo}) async {
  await deleteLibro(codigo: codigo);
}
