import 'package:biblioteca_app/domain/entities/libro.dart';
import 'package:biblioteca_app/domain/entities/solicitud.dart';
import 'package:biblioteca_app/infrastructure/entity_managers/e_libro.dart';
import 'package:biblioteca_app/infrastructure/entity_managers/e_solicitud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FrmManSolicitudes extends StatelessWidget {
  const FrmManSolicitudes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Solicitudes'),),
      body: PageSolicitudes(),
    );
  }
}


class PageSolicitudes extends StatefulWidget {
  @override
  State<PageSolicitudes> createState() => _PageSolicitudesState();
}

class _PageSolicitudesState extends State<PageSolicitudes> {
  TextEditingController codigo = TextEditingController();

  Future<List<Solicitud>> getSolicitudes() async {
    return await getSolicitudsEntity();
  }

  bool valuex = false;

  Future addLibro(String codigo) async {
    Libro libro = await getLibroEntity(codigo: codigo);
    await insertSolicitudEntity(
      solicitud: Solicitud(
        codLibro: codigo,
        codUsuario: 'U001',
        codigo: 'U001-${codigo}',
        estado: 'PENDIENTE',
        fechaSolicitud: Timestamp.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder(
            future: getSolicitudes(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Text('Libro: ${snapshot.data![index].codLibro}'),
                              Text('Estado: ${snapshot.data![index].estado}'),
                              Text(
                                  'Fecha de Solicitud: ${snapshot.data![index].fechaSolicitud.toDate()}'),
                              SwitchCustom(),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class SwitchCustom extends StatefulWidget {
  const SwitchCustom({super.key});

  @override
  State<SwitchCustom> createState() => _SwitchCustomState();
}

class _SwitchCustomState extends State<SwitchCustom> {
  bool estado = false;
  @override
  Widget build(BuildContext context) {
    return Switch(value: estado, onChanged: (value){
      setState(() {
        estado = value;
      });
    });
  }
}