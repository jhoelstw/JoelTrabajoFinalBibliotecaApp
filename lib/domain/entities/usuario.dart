class Usuario {
  String? _apellidos;
  String? _clave;
  String? _codTipo;
  String? _codigo;
  String? _email;
  String? _nombre;

  get apellidos => _apellidos;
  set apellidos(value) => _apellidos = value;
  get clave => _clave;
  set clave(value) => _clave = value;
  get codTipo => _codTipo;
  set codTipo(value) => _codTipo = value;
  get codigo => _codigo;
  set codigo(value) => _codigo = value;
  get email => _email;
  set email(value) => _email = value;
  get nombre => _nombre;
  set nombre(value) => _nombre = value;

  Usuario({
    required apellidos,
    required clave,
    required codTipo,
    required codigo,
    required email,
    required nombre,
  }) {
    _apellidos = apellidos;
    _clave = clave;
    _codTipo = codTipo;
    _codigo = codigo;
    _email = email;
    _nombre = nombre;
  }

  @override
  String toString() {
    return 'Usuario(_apellidos: $_apellidos, _clave: $_clave, _codTipo: $_codTipo, _codigo: $_codigo, _email: $_email, _nombre: $_nombre)';
  }

  Map<String, dynamic> toJson() {
    return {
      'apellidos': _apellidos,
      'clave': _clave,
      'codTipo': _codTipo,
      'codigo': _codigo,
      'email': _email,
      'nombre': _nombre,
    };
  }
  static List<Map<String, dynamic>> toJsonList(List<Usuario> usuarioList) {
    return usuarioList.map((e) => e.toJson()).toList();
  }

  static Usuario fromJson(Map<String, dynamic> json) {
    return Usuario(
      apellidos: json['apellidos'],
      clave: json['clave'],
      codTipo: json['codTipo'],
      codigo: json['codigo'],
      email: json['email'],
      nombre: json['nombre'],
    );
  }
  static List<Usuario> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((e) => fromJson(e)).toList();
  }
}
