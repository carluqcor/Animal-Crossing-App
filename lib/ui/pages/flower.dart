import 'package:ACApp/models/index.dart';
import 'package:ACApp/repositories/flower.dart';
import 'package:ACApp/util/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../repositories/index.dart';
import '../widgets/index.dart';

/// This tab holds information about SpaceX-as-a-company,
/// such as various numbers & achievements.
class FlowerPage extends StatelessWidget {
  final Flower _flower;
  FlowerPage(this._flower);

  @override
  Widget build(BuildContext context) {
    return Consumer<FlowerRepository>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Animal Crossing: New Horizons'),
          centerTitle: true,
        ),
        body: model.isLoading
            ? LoadingIndicator()
            : Column(children: <Widget>[
                Center(
                    child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: _flower.x,
                  childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1.5),
                  primary: false,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  children: _flower.data
                      .map((item) => Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: GridTile(
                              child: new Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  child: getFlowerIcon(item, _flower.name),
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
