import 'package:cloud_firestore/cloud_firestore.dart';

class Arriendo {
  String? _codLibro;
  String? _codUsuario;
  String? _codigo;
  String? _estado;
  Timestamp? _fechaDevolucion;
  Timestamp? _fechaPrestamo;
  int? _multa;

  get codLibro => _codLibro;
  set codLibro(value) => _codLibro = value;
  get codUsuario => _codUsuario;
  set codUsuario(value) => _codUsuario = value;
  get codigo => _codigo;
  set codigo(value) => _codigo = value;
  get estado => _estado;
  set estado(value) => _estado = value;
  get fechaDevolucion => _fechaDevolucion;
  set fechaDevolucion(value) => _fechaDevolucion = value;
  get fechaPrestamo => _fechaPrestamo;
  set fechaPrestamo(value) => _fechaPrestamo = value;
  get multa => _multa;
  set multa(value) => _multa = value;

  Arriendo({
    required codLibro,
    required codUsuario,
    required codigo,
    required estado,
    required fechaDevolucion,
    required fechaPrestamo,
    required multa,
  }) {
    _codLibro = codLibro;
    _codUsuario = codUsuario;
    _codigo = codigo;
    _estado = estado;
    _fechaDevolucion = fechaDevolucion;
    _fechaPrestamo = fechaPrestamo;
    _multa = multa;
  }

  @override
  String toString() {
    return 'Arriendo(_codLibro: $_codLibro, _codUsuario: $_codUsuario, _codigo: $_codigo, _estado: $_estado, _fechaDevolucion: $_fechaDevolucion, _fechaPrestamo: $_fechaPrestamo, _multa: $_multa)';
  }

  Map<String, dynamic> toJson() {
    return {
      'codLibro': _codLibro,
      'codUsuario': _codUsuario,
      'codigo': _codigo,
      'estado': _estado,
      'fechaDevolucion': _fechaDevolucion?.millisecondsSinceEpoch,
      'fechaPrestamo': _fechaPrestamo?.millisecondsSinceEpoch,
      'multa': _multa,
    };
  }

  static List<Map<String, dynamic>> toJsonList(List<Arriendo> arriendoList) {
    return arriendoList.map((e) => e.toJson()).toList();
  }

  static Arriendo fromJson(Map<String, dynamic> json) {
    return Arriendo(
      codLibro: json['codLibro'],
      codUsuario: json['codUsuario'],
      codigo: json['codigo'],
      estado: json['estado'],
      fechaDevolucion: json['fechaDevolucion'],
      fechaPrestamo: json['fechaPrestamo'],
      multa: json['multa'],
    );
  }

  static List<Arriendo> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((e) => fromJson(e)).toList();
  }
}
