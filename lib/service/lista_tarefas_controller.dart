import 'package:get/get.dart';
import 'package:provider_dio/models/tasks.dart';

class ListaTarefasController extends GetxController {
  List<Tasks> get tarefas => _apenasNaoConcluidos.value
      ? _tarefas.where((element) => !element.concluido).toList().obs
      : _tarefas.toList().obs;

  var _apenasNaoConcluidos = false.obs;
  bool get apenasNaoConcluidos => _apenasNaoConcluidos.value;
  void setApenasNaoconcluidos(bool value) {
    _apenasNaoConcluidos.value = value;
  }

  RxList<Tasks> _tarefas = <Tasks>[].obs;

  adicionar(String descricao) {
    _tarefas.add(Tasks(descricao, false));
  }

  alterar(String id, String descricao, bool concluido) {
    var tarefa = _tarefas.firstWhere((element) => element.id == id);
    tarefa.descricao = descricao;
    tarefa.concluido = concluido;
    _tarefas.refresh();
  }

  excluir(String id) {
    _tarefas.removeWhere((element) => element.id == id);
  }
}
