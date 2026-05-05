import 'package:cloud_firestore/cloud_firestore.dart';

class Evento {
  final String id;
  final String nombre;
  final String descripcion;
  final DateTime fecha;
  final String ubicacion;
  final String creadorId;

  Evento({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.fecha,
    required this.ubicacion,
    required this.creadorId,
  });

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'descripcion': descripcion,
      'fecha': fecha,
      'ubicacion': ubicacion,
      'creadorId': creadorId,
    };
  }

  factory Evento.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Evento(
      id: doc.id,
      nombre: data['nombre'] ?? '',
      descripcion: data['descripcion'] ?? '',
      fecha: (data['fecha'] as Timestamp).toDate(),
      ubicacion: data['ubicacion'] ?? '',
      creadorId: data['creadorId'] ?? '',
    );
  }
}
