import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../repositories/index.dart';
import '../widgets/index.dart';

/// This tab holds information about SpaceX-as-a-company,
/// such as various numbers & achievements.
class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodayRepository>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Animal Crossing: New Horizons'),
          centerTitle: true,
        ),
        body: model.isLoading
            ? LoadingIndicator()
            : Column(children: <Widget>[
                Row(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      FontAwesome.leaf,
                      size: 56,
                      color: Theme.of(context).textTheme.caption.color,
                    ),
                  ),
                  Separator.spacer(width: 16),
                  Expanded(
                    child: Text(
                      model.today.message,
                      style: Theme.of(context).textTheme.title.copyWith(
                            color: Theme.of(context).textTheme.caption.color,
                          ),
                    ),
                  ),
                ]),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: model.today.events.length,
                    itemBuilder: (BuildContext context, int index) {
                      return new Text(
                        model.today.events[index],
                        style: Theme.of(context).textTheme.title.copyWith(
                              color: Theme.of(context).textTheme.caption.color,
                            ),
                      );
                    }),
                Center(
                    child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  primary: false,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: model.today.villagerImages
                      .map((item) => Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: GridTile(
                              child: new Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  child: CacheImage(item),
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                )),
              ]),
      ),
    );
  }
}
