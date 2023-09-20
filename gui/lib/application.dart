import 'package:flutter/material.dart';

import 'database_scaffold.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  build(context) {
    return MaterialApp(
      title: 'Database',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const DatabaseScaffold(),
    );
  }
}
