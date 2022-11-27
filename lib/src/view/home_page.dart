import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sprinttwodesafio/src/controller/todo_controller.dart';
import 'package:sprinttwodesafio/src/model/process_rec_model.dart';
import 'package:sprinttwodesafio/src/view/widget/item_list.dart';
import 'package:sprinttwodesafio/strings.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = GetIt.instance.get<TodoControllerList>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(Strings.homePageTitle),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: const Center(
                  child: Text(
                Strings.homePageNameContainer1,
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ),
        Observer(
          builder: (context) => SingleChildScrollView(
            child: SizedBox(
              height: 500,
              child: controller.list.isEmpty
                  ? const Center(child: SizedBox(child: Text(Strings.homePageListaVazia),))
                  : Observer(builder: (_) {
                      return SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                  itemCount: controller.list
                      .length,
                  itemBuilder: (context, index) => Dismissible(
                        key: ValueKey<Todo>(
                            controller.list[index]),
                        direction: DismissDirection.endToStart,
                        background: Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Container(
                              color: const Color.fromARGB(162, 244, 67, 54)),
                        ),
                        onDismissed: (direction) {
                          var id = controller.list
                            .toList()[index].id;
                            controller.emoveByID(id);
                        },
                        child: ItemList(
                          controller.list
                              .toList()[index],
                          key: ValueKey<int>(index),
                        ),
                      )));
                    }),
            ),
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed('/task'),
      ),
    );
  }
}
