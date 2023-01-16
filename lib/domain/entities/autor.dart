import 'dart:convert';

class Autor {
  String? _codigo;
  String? _nombre;
  String? _apellidos;

  get codigo => _codigo;
  set codigo(value) => _codigo = value;
  get nombre => _nombre;
  set nombre(value) => _nombre = value;
  get apellidos => _apellidos;
  set apellidos(value) => _apellidos = value;

  Autor({
    required codigo,
    required nombre,
    required apellidos,
  }) {
    _codigo = codigo;
    _nombre = nombre;
    _apellidos = apellidos;
  }

  @override
  String toString() =>
      'Autor(_codigo: $_codigo, _nombre: $_nombre, _apellidos: $_apellidos)';

  Map<String, dynamic> toJson() {
    return {
      'codigo': _codigo,
      'nombre': _nombre,
      'apellidos': _apellidos,
    };
  }

  static List<Map<String, dynamic>> toJsonList(List<Autor> autorList) {
    return autorList.map((e) => e.toJson()).toList();
  }

  static Autor fromJson(Map<String, dynamic> json) {
    return Autor(
      codigo: json['codigo'],
      nombre: json['nombre'],
      apellidos: json['apellidos'],
    );
  }

  static List<Autor> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((e) => fromJson(e)).toList();
  }
}
