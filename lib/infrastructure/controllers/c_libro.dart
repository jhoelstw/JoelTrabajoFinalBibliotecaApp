import 'package:biblioteca_app/infrastructure/controllers/conexion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// C: CREATE
Future insertLibro({required Map<String, dynamic> json}) async {
  await insert(json: json, collectionId: 'libros');
}

// R: READ
Future<Map<String, dynamic>> getLibro({required String codigo}) async {
  return await getDocument(codigo: codigo, collectionId: 'libros');
}

Future<List<Map<String, dynamic>>> getLibros() async {
  return await getDocuments(collectionId: 'libros');
}

// U: UPDATE
Future updateLibro(
    {required String codigo,
    required String field,
    required String newValue}) async {
  QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
      .instance
      .collection('libros')
      .where('codigo', isEqualTo: codigo)
      .get();
  for (var document in snapshot.docs) {
    document.reference.update({field: newValue});
  }
}

// D: DELETE
Future deleteLibro({required String codigo}) async {
  await deleteDocument(codigo: codigo, collectionId: 'libros');
}