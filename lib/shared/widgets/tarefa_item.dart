import 'package:flutter/material.dart';
import 'package:provider_dio/main.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider_dio/models/tarefa_mobx.dart';
import 'package:provider_dio/models/lista_tarefa_store.dart';

class TarefaItem extends StatelessWidget {
  final TarefaStore tarefa;
  const TarefaItem({super.key, required this.tarefa});

  @override
  Widget build(BuildContext context) {
    var listaTarefasStore = getIt<ListaTarefasStore>();
    return Observer(
      builder: (_) {
        return Dismissible(
          onDismissed: (DismissDirection dismissDirection) async {
            listaTarefasStore.excluir(
              tarefa.id,
            );
          },
          key: Key(
            tarefa.descricao,
          ),
          child: ListTile(
            title: Text(tarefa.descricao),
            trailing: Switch(
              onChanged: (bool value) async {
                //tarefa.concluido = value;
                listaTarefasStore.alterar(
                  tarefa.id,
                  tarefa.descricao,
                  value,
                );
              },
              value: tarefa.concluido,
            ),
          ),
        );
      },
    );
  }
}
