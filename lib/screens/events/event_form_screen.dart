import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../services/firestore_service.dart';
import '../../models/event_model.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/custom_button.dart';

class EventFormScreen extends StatefulWidget {
  final Evento? evento;
  const EventFormScreen({Key? key, this.evento}) : super(key: key);

  @override
  _EventFormScreenState createState() => _EventFormScreenState();
}

class _EventFormScreenState extends State<EventFormScreen> {
  final _nombreController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _ubicacionController = TextEditingController();
  final _firestoreService = FirestoreService();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.evento != null) {
      _nombreController.text = widget.evento!.nombre;
      _descripcionController.text = widget.evento!.descripcion;
      _ubicacionController.text = widget.evento!.ubicacion;
    }
  }

  void _save() async {
    if (_nombreController.text.isEmpty) return;

    setState(() => _isLoading = true);
    final user = FirebaseAuth.instance.currentUser;
    
    final nuevoEvento = Evento(
      id: widget.evento?.id ?? '',
      nombre: _nombreController.text,
      descripcion: _descripcionController.text,
      fecha: DateTime.now(), // Para simplificar, usamos ahora, pero podrías agregar un selector
      ubicacion: _ubicacionController.text,
      creadorId: user?.uid ?? '',
    );

    if (widget.evento == null) {
      await _firestoreService.addEvento(nuevoEvento);
    } else {
      await _firestoreService.updateEvento(nuevoEvento);
    }

    setState(() => _isLoading = false);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.evento == null ? 'Nuevo Evento' : 'Editar Evento',
          style: GoogleFonts.outfit(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            CustomTextField(
              controller: _nombreController,
              label: 'Nombre del Evento',
              icon: Icons.event,
            ),
            CustomTextField(
              controller: _descripcionController,
              label: 'Descripción',
              icon: Icons.description,
            ),
            CustomTextField(
              controller: _ubicacionController,
              label: 'Ubicación',
              icon: Icons.location_on,
            ),
            const SizedBox(height: 30),
            _isLoading
                ? const CircularProgressIndicator()
                : CustomButton(
                    text: widget.evento == null ? 'Crear Evento' : 'Guardar Cambios',
                    onPressed: _save,
                  ),
          ],
        ),
      ),
    );
  }
}
