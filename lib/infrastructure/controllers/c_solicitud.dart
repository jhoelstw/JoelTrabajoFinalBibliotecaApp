import 'package:biblioteca_app/infrastructure/controllers/conexion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// C: CREATE
Future insertSolicitud({required Map<String, dynamic> json}) async {
  await insert(json: json, collectionId: 'solicitudes');
}

// R: READ
Future<Map<String, dynamic>> getSolicitud({required String codigo}) async {
  return await getDocument(codigo: codigo, collectionId: 'solicitudes');
}

Future<List<Map<String, dynamic>>> getSolicituds() async {
  return await getDocuments(collectionId: 'solicitudes');
}

// U: UPDATE
Future updateSolicitud(
    {required String codigo,
    required String field,
    required String newValue}) async {
  QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
      .instance
      .collection('solicitudes')
      .where('codigo', isEqualTo: codigo)
      .get();
  for (var document in snapshot.docs) {
    document.reference.update({field: newValue});
  }
}

// D: DELETE
Future deleteSolicitud({required String codigo}) async {
  await deleteDocument(codigo: codigo, collectionId: 'solicitudes');
}