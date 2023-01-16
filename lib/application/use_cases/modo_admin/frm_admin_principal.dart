import 'package:biblioteca_app/application/use_cases/frm_signup.dart';
import 'package:biblioteca_app/application/use_cases/modo_admin/frm_man_devoluciones.dart';
import 'package:biblioteca_app/application/use_cases/modo_admin/frm_man_libro.dart';
import 'package:biblioteca_app/application/use_cases/modo_admin/frm_man_solicitudes.dart';
import 'package:biblioteca_app/infrastructure/controllers/c_autenticacion.dart';
import 'package:flutter/material.dart';

class FrmAdminPrincipal extends StatelessWidget {
  const FrmAdminPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido Administrador'),
        actions: [
          IconButton(
              onPressed: () async {
                await CAutenticacion.logOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => FrmSignup()));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FrmManLibros(),
                  ),
                );
              },
              label: 'Mantenimiento Libro',
            ),
            WElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FrmManSolicitudes(),
                  ),
                );
              },
              label: 'Solicitudes',
            ),
            WElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FrmManDevoluciones(),
                  ),
                );
              },
              label: 'Devoluciones',
            ),
          ],
        ),
      ),
    );
  }
}

class WElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const WElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Container(
          alignment: Alignment.center,
          width: 300,
          height: 80,
          child: Text(
            label,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
