import 'package:flutter/material.dart';
import 'package:sprinttwodesafio/src/model/process_rec_model.dart';

class ItemList extends StatefulWidget {
  const ItemList(this.itens, {super.key});

  final Todo itens;

  @override
  State<ItemList> createState() => _ItemTransecState();
}

class _ItemTransecState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.itens.assunt),
      subtitle: Text(widget.itens.descri),
      leading: Checkbox(
        value: widget.itens.valor,
        onChanged: (value) {
          setState(() {
            widget.itens.valor = !widget.itens.valor;
          });
        },
      ),
    );
  }
}
