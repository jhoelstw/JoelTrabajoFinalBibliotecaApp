import 'package:biblioteca_app/infrastructure/controllers/conexion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// C: CREATE
Future insertTipoUsuario({required Map<String, dynamic> json}) async {
  await insert(json: json, collectionId: 'tipo-usuarios');
}

// R: READ
Future<Map<String, dynamic>> getTipoUsuario({required String codigo}) async {
  return await getDocument(codigo: codigo, collectionId: 'tipo-usuarios');
}

Future<List<Map<String, dynamic>>> getTipoUsuarios() async {
  return await getDocuments(collectionId: 'tipo-usuarios');
}

// U: UPDATE
Future updateTipoUsuario(
    {required String codigo,
    required String field,
    required String newValue}) async {
  QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
      .instance
      .collection('tipo-usuarios')
      .where('codigo', isEqualTo: codigo)
      .get();
  for (var document in snapshot.docs) {
    document.reference.update({field: newValue});
  }
}

// D: DELETE
Future deleteTipoUsuario({required String codigo}) async {
  await deleteDocument(codigo: codigo, collectionId: 'tipo-usuarios');
}