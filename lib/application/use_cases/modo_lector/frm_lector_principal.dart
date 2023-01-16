import 'package:biblioteca_app/application/use_cases/frm_signup.dart';
import 'package:biblioteca_app/domain/entities/arriendo.dart';
import 'package:biblioteca_app/domain/entities/libro.dart';
import 'package:biblioteca_app/domain/entities/solicitud.dart';
import 'package:biblioteca_app/infrastructure/controllers/c_autenticacion.dart';
import 'package:biblioteca_app/infrastructure/entity_managers/e_arriendo.dart';
import 'package:biblioteca_app/infrastructure/entity_managers/e_libro.dart';
import 'package:biblioteca_app/infrastructure/entity_managers/e_solicitud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FrmLectorPrincipal extends StatefulWidget {
  FrmLectorPrincipal({super.key});

  @override
  State<FrmLectorPrincipal> createState() => _FrmLectorPrincipalState();
}

class _FrmLectorPrincipalState extends State<FrmLectorPrincipal> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    PageCatalogo(),
    PageSolicitudes(),
    PageMora(),
  ];

  final List<String> _titles = [
    'Catalogo',
    'Solicitudes',
    'Mora',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_currentIndex],
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await CAutenticacion.logOut();
              Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => FrmSignup()));
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Catalogo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Solicitudes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Mora',
          ),
        ],
      ),
    );
  }
}

class PageCatalogo extends StatelessWidget {
  Future<List<Libro>> getLibros() async {
    return await getLibrosEntity();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getLibros(),
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
                        Image.network(
                          snapshot.data![index].miniatura,
                          width: 200,
                        ),
                        Text(
                          snapshot.data![index].nombre,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text('ISBN: ${snapshot.data![index].isbn}'),
                        Text('NumCopias: ${snapshot.data![index].numCopias}'),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
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
        WTextField(hintText: 'Codigo de Libro', controller: codigo),
        ElevatedButton(
          onPressed: () async {
            await addLibro(codigo.text).then((value) {
              setState(() {});
            });
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Agregar Libro'),
          ),
        ),
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

class PageMora extends StatelessWidget {
  Future<List<Arriendo>> getArriendos() async {
    return await getArriendosEntity();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getArriendos(),
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
                            'Fecha de Prestamo: ${snapshot.data![index].fechaPrestamo.toDate()}'),
                        Text(
                            'Fecha de Devolucion: ${snapshot.data![index].fechaDevolucion.toDate()}'),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
