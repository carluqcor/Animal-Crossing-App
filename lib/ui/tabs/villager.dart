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
class VillagerTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<VillagerRepository>(
      builder: (context, model, child) => Scaffold(
        body: model.isLoading
            ? LoadingIndicator()
            : ListView.separated(
                itemCount: model.villagerList?.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  final Villager villager = model.getVillager(index);
                  if (villager.image != null) {
                    return ListTile(
                      leading: SizedBox(
                        child: CacheImage(villager.image),
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
                  return Separator.divider(indent: 72);
                },
              ),
        /*floatingActionButton: FloatingActionButton(
          heroTag: null,
          tooltip: FlutterI18n.translate(
            context,
            'spacex.other.tooltip.search',
          ),
          onPressed: () => showSearch(
            context: context,
            delegate: SearchPage<VehicleInfo>(
              items: model.villagerList,
              searchLabel: FlutterI18n.translate(
                context,
                'spacex.other.tooltip.search',
              ),
              suggestion: BigTip(
                title: Text(
                  FlutterI18n.translate(
                    context,
                    'spacex.villager.title',
                  ),
                ),
                subtitle: Text(
                  FlutterI18n.translate(
                    context,
                    'spacex.search.suggestion.villager',
                  ),
                ),
                child: Icon(Icons.search),
              ),
              failure: BigTip(
                title: Text(
                  FlutterI18n.translate(
                    context,
                    'spacex.vehicle.title',
                  ),
                ),
                subtitle: Text(
                  FlutterI18n.translate(
                    context,
                    'spacex.search.failure',
                  ),
                ),
                child: Icon(Icons.sentiment_dissatisfied),
              ),
              filter: (vehicle) => [
                vehicle.name,
                vehicle.year,
              ],
            ),
          ),
        ),*/
      ),
    );
  }
}
