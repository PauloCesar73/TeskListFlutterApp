import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sprinttwodesafio/src/controller/todo_controller.dart';
import 'package:sprinttwodesafio/src/model/process_rec_model.dart';
import 'package:sprinttwodesafio/strings.dart';

class NewTask extends StatelessWidget {
  NewTask({super.key});

  final _formKey = GlobalKey<FormState>();

  final controller = GetIt.instance.get<TodoControllerList>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Strings.appBarTitleName),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Observer(
              builder: (context) => Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null) return Strings.validatorFormisNull;
                        if (value.isEmpty) return Strings.validatorFormisNull;
                        if (value.length < 3) return Strings.validatorFormisCaracter;

                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: Strings.textLabelFormFild1,
                          labelText: Strings.textHintFormFild1),
                      onChanged: (value) {
                        controller.setAssunt(value);
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null) return Strings.validatorFormisNull;
                        if (value.isEmpty) return Strings.validatorFormisNull;
                        if (value.length < 3) return Strings.validatorFormisCaracter;

                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: Strings.textLabelFormFild2,
                          labelText: Strings.textHintFormFild2),
                      onChanged: (value) {
                        controller.setDescri(value);
                      },
                    ),
                    const SizedBox(height: 32,),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(seconds: 1),
                                  backgroundColor:
                                      Color.fromARGB(220, 0, 89, 255),
                                  content: Text(
                                    Strings.concluido,
                                    textAlign: TextAlign.center,
                                  )),
                            );
                            var lista = Todo(
                                assunt: controller.assunt,
                                descri: controller.descri,
                                );
                            controller.addList(lista);
                          }
                        },
                        child: const Text('Adicionar')),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
