import 'package:cloud_firestore/cloud_firestore.dart';

class Solicitud {
  String? _codLibro;
  String? _codUsuario;
  String? _codigo;
  String? _estado;
  Timestamp? _fechaSolicitud;

  get codLibro => _codLibro;
  set codLibro(value) => _codLibro = value;
  get codUsuario => _codUsuario;
  set codUsuario(value) => _codUsuario = value;
  get codigo => _codigo;
  set codigo(value) => _codigo = value;
  get estado => _estado;
  set estado(value) => _estado = value;
  get fechaSolicitud => _fechaSolicitud;
  set fechaSolicitud(value) => _fechaSolicitud = value;

  Solicitud({
    required codLibro,
    required codUsuario,
    required codigo,
    required estado,
    required fechaSolicitud,
  }) {
    _codLibro = codLibro;
    _codUsuario = codUsuario;
    _codigo = codigo;
    _estado = estado;
    _fechaSolicitud = fechaSolicitud;
  }

  @override
  String toString() {
    return 'Solicitud(_codLibro: $_codLibro, _codUsuario: $_codUsuario, _codigo: $_codigo, _estado: $_estado, _fechaSolicitud: $_fechaSolicitud)';
  }

  Map<String, dynamic> toJson() {
    return {
      'codLibro': _codLibro,
      'codUsuario': _codUsuario,
      'codigo': _codigo,
      'estado': _estado,
      'fechaSolicitud': _fechaSolicitud,
    };
  }

  static List<Map<String, dynamic>> toJsonList(List<Solicitud> solicitudList) {
    return solicitudList.map((e) => e.toJson()).toList();
  }

  static Solicitud fromJson(Map<String, dynamic> json) {
    return Solicitud(
      codLibro: json['codLibro'],
      codUsuario: json['codUsuario'],
      codigo: json['codigo'],
      estado: json['estado'],
      fechaSolicitud: json['fechaSolicitud'],
    );
  }

  static List<Solicitud> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((e) => fromJson(e)).toList();
  }
}
