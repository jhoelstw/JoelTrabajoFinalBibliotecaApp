import 'package:biblioteca_app/infrastructure/controllers/conexion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// C: CREATE
Future insertArriendo({required Map<String, dynamic> json}) async {
  await insert(json: json, collectionId: 'arriendos');
}

// R: READ
Future<Map<String, dynamic>> getArriendo({required String codigo}) async {
  return await getDocument(codigo: codigo, collectionId: 'arriendos');
}

Future<List<Map<String, dynamic>>> getArriendos() async {
  return await getDocuments(collectionId: 'arriendos');
}

// U: UPDATE
Future updateArriendo(
    {required String codigo,
    required String field,
    required String newValue}) async {
  QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
      .instance
      .collection('arriendos')
      .where('codigo', isEqualTo: codigo)
      .get();
  for (var document in snapshot.docs) {
    document.reference.update({field: newValue});
  }
}

// D: DELETE
Future deleteArriendo({required String codigo}) async {
  await deleteDocument(codigo: codigo, collectionId: 'arriendos');
}