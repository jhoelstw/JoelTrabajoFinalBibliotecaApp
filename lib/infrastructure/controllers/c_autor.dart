import 'package:biblioteca_app/infrastructure/controllers/conexion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// C: CREATE
Future insertAutor({required Map<String, dynamic> json}) async {
  await insert(json: json, collectionId: 'autores');
}

// R: READ
Future<Map<String, dynamic>> getAutor({required String codigo}) async {
  return await getDocument(codigo: codigo, collectionId: 'autores');
}

Future<List<Map<String, dynamic>>> getAutores() async {
  return await getDocuments(collectionId: 'autores');
}

// U: UPDATE
Future updateAutor(
    {required String codigo,
    required String field,
    required String newValue}) async {
  QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
      .instance
      .collection('autores')
      .where('codigo', isEqualTo: codigo)
      .get();
  for (var document in snapshot.docs) {
    document.reference.update({field: newValue});
  }
}

// D: DELETE
Future deleteAutor({required String codigo}) async {
  await deleteDocument(codigo: codigo, collectionId: 'autores');
}