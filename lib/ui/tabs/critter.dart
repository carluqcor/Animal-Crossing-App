import 'package:ACApp/ui/pages/index.dart';
import 'package:ACApp/ui/screens/index.dart';
import 'package:ACApp/ui/widgets/index.dart';
import 'package:ACApp/util/index.dart';
import 'package:big_tip/big_tip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:search_page/search_page.dart';

import '../widgets/index.dart';
import '../../models/index.dart';
import '../../repositories/index.dart';

class CritterTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var date = new DateTime.now();
    return Consumer<CritterRepository>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            FlutterI18n.translate(
              context,
              'ac.critters.title',
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
        body: RefreshIndicator(
          onRefresh: () => onRefresh(context, model),
          child: model.isLoading
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
                        trailing: getAvailableCritter(
                                    date, critter.timeYear, critter.timeDay) ||
                                critter.timeYear == 'All year'
                            ? Icon(FontAwesome.check_circle, color: acceptIcon)
                            : Icon(Entypo.circle_with_cross, color: denyIcon),
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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.search),
          heroTag: null,
          tooltip: FlutterI18n.translate(
            context,
            'ac.other.tooltip.search',
          ),
          onPressed: () => showSearch(
            context: context,
            delegate: SearchPage<Critter>(
                items: model.critterList,
                searchLabel: FlutterI18n.translate(
                  context,
                  'ac.other.tooltip.search',
                ),
                suggestion: BigTip(
                  title: Text(
                    FlutterI18n.translate(
                      context,
                      'ac.critters.title',
                    ),
                  ),
                  subtitle: Text(
                    FlutterI18n.translate(
                      context,
                      'ac.search.suggestion.critter',
                    ),
                  ),
                  child: Icon(Icons.search),
                ),
                failure: BigTip(
                  title: Text(
                    FlutterI18n.translate(
                      context,
                      'ac.critters.title',
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
                filter: (critter) => [critter.name, critter.rarity],
                showItemsOnEmpty: true,
                builder: (critter) => ListTile(
                      leading: SizedBox(
                        child: CacheImage(critter.image),
                      ),
                      title: Text(critter.name),
                      trailing: getAvailableCritter(
                                  date, critter.timeYear, critter.timeDay) ||
                              critter.timeYear == 'All year'
                          ? Icon(FontAwesome.check_circle,
                              color: Colors.greenAccent)
                          : Icon(Entypo.circle_with_cross,
                              color: Colors.redAccent),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CritterPage(critter),
                        ),
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}
