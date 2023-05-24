import 'package:flutter/cupertino.dart';
import 'package:provider_dio/models/tasks.dart';

class TasksRepository extends ChangeNotifier {
  final _tarefas = <Tasks>[];
  var _apenasNaoConcluidos = false;

  set apenasNaoConcluidos(bool value) {
    _apenasNaoConcluidos = value;
    notifyListeners();
  }

  bool get apenasNaoConcluidos => _apenasNaoConcluidos;

  get tarefas => _apenasNaoConcluidos
      ? _tarefas.where((element) => !element.concluido).toList()
      : _tarefas;

  adicionar(Tasks tarefa) {
    _tarefas.add(tarefa);
    notifyListeners();
  }

  alterar(String id, bool concluido) {
    _tarefas.where((element) => element.id == id).first.concluido = concluido;
    notifyListeners();
  }

  remover(String id) {
    _tarefas.remove(_tarefas.where((element) => element.id == id).first);
    notifyListeners();
  }
}
