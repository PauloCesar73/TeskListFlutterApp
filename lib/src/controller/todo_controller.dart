import 'package:mobx/mobx.dart';
import 'package:sprinttwodesafio/src/model/process_rec_model.dart';
part 'todo_controller.g.dart';

class TodoControllerList = TodoControllerListBase with _$TodoControllerList;

abstract class TodoControllerListBase with Store {
    ObservableList<Todo> list = ObservableList<Todo>.of([]);

  @observable
  String assunt = '';

  @observable
  String descri = '';

  @observable
  bool valor = false;

  @action
  setAssunt(String value) {
    assunt = value;
  }

  @action
  emoveByID(String id) {
    list.removeWhere((e) => e.id == id);
  }

  @action
  setDescri(String value) {
    descri = value;
  }

  @action
  addList(Todo lista) {
    list.add(lista);
  }
}
