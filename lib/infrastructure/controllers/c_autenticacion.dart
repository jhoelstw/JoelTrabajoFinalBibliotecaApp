import 'package:biblioteca_app/domain/entities/usuario.dart';
import 'package:biblioteca_app/infrastructure/entity_managers/e_usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CAutenticacion {
  static Future<bool> signUp(
      {required String email,
      required String password,
      required String apellidos,
      required String codTipo,
      required String nombre}) async {
    try {
      final auth = FirebaseAuth.instance;
      final result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      debugPrint(result.user!.uid);
      await insertUsuarioEntity(
        usuario: Usuario(
          apellidos: apellidos,
          clave: password,
          codTipo: codTipo,
          codigo: password,
          email: email,
          nombre: nombre,
        ),
      );
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  static Future<bool> logIn(String email, String password) async {
    try {
      final auth = FirebaseAuth.instance;
      final result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      debugPrint(result.user!.uid);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  static Future logOut() async {
    try {
      final auth = FirebaseAuth.instance;
      await auth.signOut();
      print("Sesión cerrada");
    } catch (e) {
      print(e);
    }
  }
}
