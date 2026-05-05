class Usuario {
  final String uid;
  final String email;
  final String? nombre;
  final String? fotoUrl;

  Usuario({
    required this.uid,
    required this.email,
    this.nombre,
    this.fotoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'nombre': nombre,
      'fotoUrl': fotoUrl,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> data) {
    return Usuario(
      uid: data['uid'] ?? '',
      email: data['email'] ?? '',
      nombre: data['nombre'],
      fotoUrl: data['fotoUrl'],
    );
  }
}
