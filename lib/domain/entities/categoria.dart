class Categoria {
  String? _codigo;
  String? _nombre;

  get codigo => this._codigo;
  set codigo(value) => this._codigo = value;
  get nombre => this._nombre;
  set nombre(value) => this._nombre = value;

  Categoria({
    required codigo,
    required nombre,
  }) {
    _codigo = codigo;
    _nombre = nombre;
  }

  @override
  String toString() => 'Categoria(_codigo: $_codigo, _nombre: $_nombre)';

  Map<String, dynamic> toJson() {
    return {
      'codigo': _codigo,
      'nombre': _nombre,
    };
  }

  static List<Map<String, dynamic>> toJsonList(List<Categoria> categoriaList) {
    return categoriaList.map((e) => e.toJson()).toList();
  }

  static Categoria fromJson(Map<String, dynamic> json) {
    return Categoria(codigo: json['codigo'], nombre: json['nombre']);
  }

  static List<Categoria> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((e) => fromJson(e)).toList();
  }


}
