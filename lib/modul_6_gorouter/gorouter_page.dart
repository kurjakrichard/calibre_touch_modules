import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/enums.dart';

class GorouterPage extends StatelessWidget {
  const GorouterPage({super.key, required this.name, required this.gorouter});
  final String name;
  final String gorouter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome $name')),
      body: Column(
        children: [
          Center(child: Text('gorouter: $gorouter')),
          Center(child:   ElevatedButton(
                    onPressed: () => context.goNamed(Routes.home.name),
                    child: const Text('HomePage'),),
              ),
        ],
      ), ); 
  }
}