import 'package:ACApp/ui/pages/index.dart';
import 'package:ACApp/ui/screens/settings.dart';
import 'package:ACApp/ui/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';

import '../widgets/index.dart';
import '../../models/index.dart';
import '../../repositories/index.dart';

class FossilTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FossilRepository>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            FlutterI18n.translate(
              context,
              'ac.fossils.title',
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
                itemCount: model.fossilList?.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  final Fossil fossil = model.getFossil(index);
                  if (fossil.image != null) {
                    return ListTile(
                      leading: SizedBox(
                        child: CacheImage(fossil.image),
                      ),
                      title: Text(fossil.name),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FossilPage(fossil),
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
