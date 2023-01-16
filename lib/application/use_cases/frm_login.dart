import 'package:biblioteca_app/application/use_cases/frm_signup.dart';
import 'package:biblioteca_app/application/use_cases/modo_admin/frm_admin_principal.dart';
import 'package:biblioteca_app/application/use_cases/modo_lector/frm_lector_principal.dart';
import 'package:biblioteca_app/infrastructure/controllers/c_autenticacion.dart';
import 'package:biblioteca_app/infrastructure/entity_managers/e_usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FrmLogin extends StatelessWidget {
  FrmLogin({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController clave = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        const SizedBox(
          height: 150,
        ),
        const Text(
          'INICIAR SESION',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
        ),
        const Text(
          'Biblioteca',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30),
        ),
        const SizedBox(
          height: 40,
        ),
        WTextField(hintText: 'Email', controller: email),
        WTextField(hintText: 'Contraseña', controller: clave),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: ElevatedButton(
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Iniciar sesión',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onPressed: () {
              CAutenticacion.logIn(email.text, clave.text).then((value) async {
                await getUsuarioEntity(codigo: clave.text).then(
                  (usuario) {
                    var codTipo = usuario.codTipo;
                    if (value) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => codTipo == "ADMIN"
                              ? FrmAdminPrincipal()
                              : FrmLectorPrincipal(),
                        ),
                      );
                    }
                  },
                );
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('¿Aun no tienes una cuenta?'),
            const SizedBox(
              width: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => FrmSignup()));
              },
              child: const Text(
                'Registrarse',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}

class WTextField extends StatelessWidget {
  String hintText;
  TextEditingController? controller;

  WTextField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextField(
        keyboardType: TextInputType.name,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.red),
          ),
          contentPadding: EdgeInsets.all(15.0),
        ),
      ),
    );
  }
}
