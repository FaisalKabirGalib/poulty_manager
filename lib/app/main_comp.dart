import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poulty_manager/core/Layout/extension.dart';
import 'package:styled_widget/styled_widget.dart';

class MainComponent extends StatelessWidget {
  const MainComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.go('/main');
      },
      child: const Text('Go to AllComponents'),
    ).parent(page);
  }
}
