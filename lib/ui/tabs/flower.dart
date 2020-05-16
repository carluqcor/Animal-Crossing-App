import 'package:ACApp/ui/pages/index.dart';
import 'package:ACApp/ui/screens/index.dart';
import 'package:ACApp/util/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';

import '../../repositories/index.dart';
import '../widgets/index.dart';

class FlowerTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FlowerRepository>(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Text(
                  FlutterI18n.translate(
                    context,
                    'ac.flowers.title',
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
                    : Column(
                        children: <Widget>[
                          new GridView.builder(
                            itemCount: model.flowers.length,
                            shrinkWrap: true,
                            controller:
                                new ScrollController(keepScrollOffset: false),
                            gridDelegate:
                                new SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 4,
                              childAspectRatio:
                                  MediaQuery.of(context).size.width /
                                      (MediaQuery.of(context).size.height / 2.5),
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return new Card(
                                child: new GridTile(
                                    header: new Text(
                                      getFlowerName(
                                          model.flowers[index].name, context),
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          .copyWith(),
                                      textAlign: TextAlign.center,
                                    ),
                                    child: new InkResponse(
                                      enableFeedback: true,
                                      child: Image(
                                          image: AssetImage(
                                              'assets/flowers/Flw' +
                                                  model.flowers[index].name +
                                                  model.flowers[index]
                                                      .buyable[0] +
                                                  '.png')),
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              FlowerPage(model.flowers[index]),
                                        ),
                                      ),
                                    )),
                              );
                            },
                          ),
                        ],
                      ),
              ),
            ));
  }
}
