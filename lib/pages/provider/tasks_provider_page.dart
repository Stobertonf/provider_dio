import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_dio/models/tasks.dart';
import 'package:provider_dio/repository/tasks_repository.dart';

class TasksProviderPage extends StatelessWidget {
  var descricaoContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          descricaoContoller.text = "";
          showDialog(
              context: context,
              builder: (BuildContext bc) {
                return AlertDialog(
                  title: const Text("Adicionar tarefa"),
                  content: TextField(
                    controller: descricaoContoller,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancelar")),
                    TextButton(
                      onPressed: () async {
                        Provider.of<TasksRepository>(
                          context,
                          listen: false,
                        ).adicionar(
                          Tasks(
                            descricaoContoller.text,
                            false,
                          ),
                        );
                        Navigator.pop(context);
                      },
                      child: const Text("Salvar"),
                    ),
                  ],
                );
              });
        },
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Column(
          children: [
            const Text(
              "Tarefas Provider Store",
              style: TextStyle(
                fontSize: 26,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Apenas não concluídos",
                    style: TextStyle(fontSize: 18),
                  ),
                  Consumer<TasksRepository>(
                    builder: (
                      _,
                      tarefaRepository,
                      Widget,
                    ) {
                      return Switch(
                        value: tarefaRepository.apenasNaoConcluidos,
                        onChanged: (bool value) {
                          Provider.of<TasksRepository>(context, listen: false)
                              .apenasNaoConcluidos = value;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<TasksRepository>(
                builder: (_, tarefaRepository, Widget) {
                  return ListView.builder(
                    itemCount: tarefaRepository.tarefas.length,
                    itemBuilder: (BuildContext bc, int index) {
                      var tarefa = tarefaRepository.tarefas[index];
                      return Dismissible(
                        onDismissed: (DismissDirection dismissDirection) async {
                          Provider.of<TasksRepository>(
                            context,
                            listen: false,
                          ).remover(tarefa.id);
                        },
                        key: Key(tarefa.descricao),
                        child: ListTile(
                          title: Text(tarefa.descricao),
                          trailing: Switch(
                            onChanged: (bool value) async {
                              tarefa.concluido = value;
                              Provider.of<TasksRepository>(
                                context,
                                listen: false,
                              ).alterar(tarefa.id, tarefa.concluido);
                            },
                            value: tarefa.concluido,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
