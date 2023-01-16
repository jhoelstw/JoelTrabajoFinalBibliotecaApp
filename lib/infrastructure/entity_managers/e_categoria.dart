import 'package:biblioteca_app/domain/entities/categoria.dart';
import 'package:biblioteca_app/infrastructure/controllers/c_categoria.dart';

// C: CREATE
Future insertCategoriaEntity({required Categoria categoria}) async {
  await insertCategoria(json: categoria.toJson());
}

// R: READ
Future<Categoria> getCategoriaEntity({required String codigo}) async {
  return Categoria.fromJson(await getCategoria(codigo: codigo));
}
Future<List<Categoria>> getCategoriasEntity() async {
  return (await getCategorias()).map((e) => Categoria.fromJson(e)).toList();
}

// U: UPDATE
Future updateCategoriaEntity({required String codigo, required String field, required String newValue}) async {
  await updateCategoria(codigo: codigo, field: field, newValue: newValue);
}

// D: DELETE
Future deleteCategoriaEntity({required String codigo}) async {
  await deleteCategoria(codigo: codigo);
}
