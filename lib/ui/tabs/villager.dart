import 'package:ACApp/ui/pages/index.dart';
import 'package:ACApp/ui/screens/index.dart';
import 'package:ACApp/ui/widgets/index.dart';
import 'package:ACApp/repositories/villager.dart';
import 'package:ACApp/util/index.dart';
import 'package:big_tip/big_tip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:search_page/search_page.dart';

import '../widgets/index.dart';
import '../../models/index.dart';
import '../../repositories/index.dart';

class VillagerTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<VillagerRepository>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            FlutterI18n.translate(
              context,
              'ac.villagers.title',
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SettingsScreen(),
                  ),
                );
              },
            )
          ],
          centerTitle: true,
        ),
        body: model.isLoading
            ? LoadingIndicator()
            : ListView.separated(
                itemCount: model.villagerCount,
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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.search),
          heroTag: null,
          tooltip: FlutterI18n.translate(
            context,
            'ac.other.tooltip.search',
          ),
          onPressed: () => showSearch(
            context: context,
            delegate: SearchPage<Villager>(
              items: model.villagerList,
              searchLabel: FlutterI18n.translate(
                context,
                'ac.other.tooltip.search',
              ),
              suggestion: BigTip(
                title: Text(
                  FlutterI18n.translate(
                    context,
                    'ac.villagers.title',
                  ),
                ),
                subtitle: Text(
                  FlutterI18n.translate(
                    context,
                    'ac.search.suggestion.villager',
                  ),
                ),
                child: Icon(Icons.search),
              ),
              failure: BigTip(
                title: Text(
                  FlutterI18n.translate(
                    context,
                    'ac.villagers.title',
                  ),
                ),
                subtitle: Text(
                  FlutterI18n.translate(
                    context,
                    'ac.search.failure',
                  ),
                ),
                child: Icon(Icons.sentiment_dissatisfied),
              ),
              filter: (villager) => [
                villager.name,
                villager.species,
                villager.personality,
                villager.favColor,
              ],
              builder: (villager) => ListTile(
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
