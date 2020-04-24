import 'package:ACApp/ui/pages/index.dart';
import 'package:ACApp/ui/widgets/index.dart';
import 'package:ACApp/util/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../widgets/index.dart';
import '../../models/index.dart';
import '../../repositories/index.dart';

/// This tab holds information about SpaceX-as-a-company,
/// such as various numbers & achievements.
class FossilTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FossilRepository>(
      builder: (context, model, child) => Scaffold(
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
