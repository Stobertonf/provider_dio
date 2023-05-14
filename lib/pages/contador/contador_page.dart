import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:provider_dio/service/contador_get_controller.dart';

class ContadorPage extends StatelessWidget {
  ContadorPage({super.key});
  var contadorGetXService = ContadorGetController();

  @override
  Widget build(BuildContext context) {
    print("build");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Contador GetX",
          style: TextStyle(fontSize: 26),
        ),
        Obx(() {
          return Text(
            "${contadorGetXService.contador}",
            style: const TextStyle(fontSize: 26),
          );
        }),
        TextButton(
          onPressed: () {
            contadorGetXService.incrementar();
          },
          child: const Text(
            "Incrementar",
          ),
        ),
      ],
    );
  }
}
