import 'package:ACApp/ui/pages/index.dart';
import 'package:ACApp/ui/widgets/index.dart';
import 'package:ACApp/repositories/villager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/index.dart';
import '../../models/index.dart';
import '../../repositories/index.dart';

/// This tab holds information about SpaceX-as-a-company,
/// such as various numbers & achievements.
class CritterTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CritterRepository>(
      builder: (context, model, child) => Scaffold(
        body: model.isLoading
            ? LoadingIndicator()
            : ListView.separated(
                itemCount: model.critterList?.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  final Critter critter = model.getCritter(index);
                  if (critter.image != null) {
                    return ListTile(
                      leading: SizedBox(
                        child: CacheImage(critter.image),
                      ),
                      title: Text(critter.name),
                      subtitle: Text(critter.caughtQuote != null ? critter.caughtQuote : ''),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CritterPage(critter),
                        ),
                      ),
                    );
                  }
                  return Separator.divider(indent: 72);
                },
              ),
      ),
    );
  }
}
