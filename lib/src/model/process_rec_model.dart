import 'package:uuid/uuid.dart';

class Todo {
  final String id = const Uuid().v4();
  final String assunt;
  final String descri;
  bool valor;
  
  Todo({
    this.valor = false,
    required this.assunt,
    required this.descri
  });
}