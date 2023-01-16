import 'package:biblioteca_app/infrastructure/controllers/conexion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// C: CREATE
Future insertCategoria({required Map<String, dynamic> json}) async {
  await insert(json: json, collectionId: 'Categorias');
}

// R: READ
Future<Map<String, dynamic>> getCategoria({required String codigo}) async {
  return await getDocument(codigo: codigo, collectionId: 'Categorias');
}

Future<List<Map<String, dynamic>>> getCategorias() async {
  return await getDocuments(collectionId: 'Categorias');
}

// U: UPDATE
Future updateCategoria(
    {required String codigo,
    required String field,
    required String newValue}) async {
  QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
      .instance
      .collection('Categorias')
      .where('codigo', isEqualTo: codigo)
      .get();
  for (var document in snapshot.docs) {
    document.reference.update({field: newValue});
  }
}

// D: DELETE
Future deleteCategoria({required String codigo}) async {
  await deleteDocument(codigo: codigo, collectionId: 'Categorias');
}