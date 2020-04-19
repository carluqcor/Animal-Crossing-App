import 'package:ACApp/ui/pages/index.dart';
import 'package:ACApp/ui/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/index.dart';
import '../../models/index.dart';
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
        body: model.isLoading
            ? LoadingIndicator()
            : ListView.separated(
                itemCount: model.getItemCount,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  final Villager villager = model.getItem(index);
                  if (villager.image != null) {
                    return ListTile(
                      leading: SizedBox(
                        height: 64,
                        width: 64,
                        child: Image.network(villager.image),
                      ),
                      title: Text(villager.name),
                      subtitle: Text(villager.quote),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => VillagerPage(villager),
                        ),
                      ),
                    );
                  }
                  return null;
                },
              ),
      ),
    );
  }
}
