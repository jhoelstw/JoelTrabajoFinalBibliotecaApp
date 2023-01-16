class TipoUsuario {
  String? _codigo;
  String? _nombre;

  get codigo => _codigo;
  set codigo(value) => _codigo = value;
  get nombre => _nombre;
  set nombre(value) => _nombre = value;

  TipoUsuario({
    required codigo,
    required nombre,
  }) {
    _codigo = codigo;
    _nombre = nombre;
  }

  @override
  String toString() => 'TipoUsuario(_codigo: $_codigo, _nombre: $_nombre)';

  Map<String, dynamic> toJson() {
    return {
      'codigo': _codigo,
      'nombre': _nombre,
    };
  }

  static List<Map<String, dynamic>> toJsonList(List<TipoUsuario> tipoUsuarioList) {
    return tipoUsuarioList.map((e) => e.toJson()).toList();
  }

  static TipoUsuario fromJson(Map<String, dynamic> json) {
    return TipoUsuario(
      codigo: json['codigo'],
      nombre: json['nombre'],
    );
  }

  static List<TipoUsuario> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((e) => fromJson(e)).toList();
  }
}
