import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/event_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String collectionPath = 'eventos';

  // Obtener stream de eventos
  Stream<List<Evento>> getEventos() {
    return _db.collection(collectionPath)
        .orderBy('fecha', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Evento.fromFirestore(doc))
            .toList());
  }

  // Agregar evento
  Future<void> addEvento(Evento evento) {
    return _db.collection(collectionPath).add(evento.toMap());
  }

  // Actualizar evento
  Future<void> updateEvento(Evento evento) {
    return _db.collection(collectionPath).doc(evento.id).update(evento.toMap());
  }

  // Eliminar evento
  Future<void> deleteEvento(String id) {
    return _db.collection(collectionPath).doc(id).delete();
  }
}
