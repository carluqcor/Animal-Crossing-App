import 'package:ACApp/repositories/flower.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../repositories/index.dart';
import '../widgets/index.dart';

/// This tab holds information about SpaceX-as-a-company,
/// such as various numbers & achievements.
class FlowerTab extends StatelessWidget {
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
                      crossAxisCount: model.flowers[0].x,
                      primary: false,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                      children: model.flowers[0].data
                          .map((item) => Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: GridTile(
                                  child: new Container(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      child: Image(image: AssetImage('assets/flowers/Flw'+model.flowers[0].nameEn+item+'.png')),
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
