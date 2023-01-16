import 'package:biblioteca_app/application/use_cases/frm_login.dart';
import 'package:biblioteca_app/application/use_cases/modo_admin/frm_admin_principal.dart';
import 'package:biblioteca_app/application/use_cases/modo_lector/frm_lector_principal.dart';
import 'package:biblioteca_app/infrastructure/controllers/c_autenticacion.dart';
import 'package:flutter/material.dart';

class FrmSignup extends StatelessWidget {
  FrmSignup({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController clave = TextEditingController();
  final TextEditingController apellidos = TextEditingController();
  final TextEditingController codTipo = TextEditingController();
  final TextEditingController nombre = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        const SizedBox(
          height: 150,
        ),
        const Text(
          'REGISTRARSE',
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
        WTextField(hintText: 'Apellidos', controller: apellidos),
        WTextField(hintText: 'Tipo de usuario', controller: codTipo),
        WTextField(hintText: 'Nombre', controller: nombre),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: ElevatedButton(
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Crear cuenta',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onPressed: () async {
              await CAutenticacion.signUp(
                email: email.text,
                password: clave.text,
                apellidos: apellidos.text,
                codTipo: codTipo.text,
                nombre: nombre.text,
              ).then((value) async {
                if (value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => codTipo.text == "ADMIN"
                          ? FrmAdminPrincipal()
                          : FrmLectorPrincipal(),
                    ),
                  );
                }
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('¿Ya tienes una cuenta?'),
            const SizedBox(
              width: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => FrmLogin()));
              },
              child: const Text(
                'Iniciar sesion',
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
