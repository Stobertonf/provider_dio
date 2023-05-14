import 'package:flutter/material.dart';

class ContadorProviderPage extends StatefulWidget {
  const ContadorProviderPage({super.key});

  @override
  State<ContadorProviderPage> createState() => _ContadorProviderPageState();
}

class _ContadorProviderPageState extends State<ContadorProviderPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
