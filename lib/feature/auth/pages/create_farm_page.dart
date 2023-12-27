import 'package:flutter/material.dart';

class CreateNewFarmPage extends StatelessWidget {
  const CreateNewFarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Farm'),
      ),
      body: const Center(
        child: Text('Create New Farm'),
      ),
    );
  }
}
