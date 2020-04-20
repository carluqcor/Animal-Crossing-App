import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../repositories/index.dart';

/// This tab holds information about SpaceX-as-a-company,
/// such as various numbers & achievements.
class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<VillagerRepository>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Villagers'),
          centerTitle: true,
        ),
        body: Text('Hola bienvenido a Animal Crossing: New Horizons'),
      ),
    );
  }
}
