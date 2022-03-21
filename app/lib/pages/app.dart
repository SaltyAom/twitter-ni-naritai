import 'package:flutter/material.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App'),
      ),
      body: const Center(
        child: Text('App'),
      ),
    );
  }
}
