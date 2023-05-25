import 'package:flutter/material.dart';
import 'package:provider_dio/main.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider_dio/service/counter_mobx_service.dart';

class ContadorMobXPage extends StatelessWidget {
  ContadorMobXPage({super.key});
  CounterMobXService contadorMobXService = getIt<CounterMobXService>();

  @override
  Widget build(BuildContext context) {
    print("build");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Contador MobX",
          style: TextStyle(fontSize: 26),
        ),
        Observer(builder: (context) {
          return Text(
            "${contadorMobXService.contador}",
            style: const TextStyle(
              fontSize: 26,
            ),
          );
        }),
        TextButton(
          onPressed: () {
            contadorMobXService.incrementar();
          },
          child: const Text(
            "Incrementar",
          ),
        ),
      ],
    );
  }
}
