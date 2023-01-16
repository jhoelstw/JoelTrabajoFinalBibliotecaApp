class Libro {
  String? _codAutor;
  String? _codCategoria;
  String? _codigo;
  String? _isbn;
  String? _nombre;
  int? _numCopias;
  String? _miniatura;

  get codAutor => _codAutor;
  set codAutor(value) => _codAutor = value;
  get codCategoria => _codCategoria;
  set codCategoria(value) => _codCategoria = value;
  get codigo => _codigo;
  set codigo(value) => _codigo = value;
  get isbn => _isbn;
  set isbn(value) => _isbn = value;
  get nombre => _nombre;
  set nombre(value) => _nombre = value;
  get numCopias => _numCopias;
  set numCopias(value) => _numCopias = value;
  get miniatura => _miniatura;
  set miniatura(value) => _miniatura = value;

  Libro({
    required codAutor,
    required codCategoria,
    required codigo,
    required isbn,
    required nombre,
    required numCopias,
    required miniatura,
  }) {
    _codAutor = codAutor;
    _codCategoria = codCategoria;
    _codigo = codigo;
    _isbn = isbn;
    _nombre = nombre;
    _numCopias = numCopias;
    _miniatura = miniatura;
  }

  @override
  String toString() {
    return 'Libro(_codAutor: $_codAutor, _codCategoria: $_codCategoria, _codigo: $_codigo, _isbn: $_isbn, _nombre: $_nombre, _numCopias: $_numCopias, _miniatura: $_miniatura)';
  }

  Map<String, dynamic> toJson() {
    return {
      'codAutor': _codAutor,
      'codCategoria': _codCategoria,
      'codigo': _codigo,
      'isbn': _isbn,
      'nombre': _nombre,
      'numCopias': _numCopias,
      'miniatura': _miniatura,
    };
  }

  static List<Map<String, dynamic>> toJsonList(List<Libro> libroList) {
    return libroList.map((e) => e.toJson()).toList();
  }

  static Libro fromJson(Map<String, dynamic> json) {
    return Libro(
      codAutor: json['codAutor'],
      codCategoria: json['codCategoria'],
      codigo: json['codigo'],
      isbn: json['isbn'],
      nombre: json['nombre'],
      numCopias: json['numCopias'],
      miniatura: json['miniatura'],
    );
  }

  static List<Libro> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((e) => fromJson(e)).toList();
  }
}
