import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import '../../repositories/base.dart';

/// Function which handles reloading [QueryModel] models.
Future<void> onRefresh(BuildContext context, BaseRepository repository) {
  final Completer<void> completer = Completer<void>();

  repository.refreshData().then((_) {
    if (repository.loadingFailed) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(FlutterI18n.translate(
            context,
            'spacex.other.loading_error.message',
          )),
          action: SnackBarAction(
            label: FlutterI18n.translate(
              context,
              'spacex.other.loading_error.reload',
            ),
            onPressed: () => onRefresh(context, repository),
          ),
        ),
      );
    }
    completer.complete();
  });

  return completer.future;
}
/// Basic screen, which includes an [AppBar] widget.
/// Used when the desired page doesn't have slivers or reloading.
class SimplePage extends StatelessWidget {
  final String title;
  final Widget body, fab;
  final List<Widget> actions;

  const SimplePage({
    @required this.title,
    @required this.body,
    this.fab,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontFamily: 'ProductSans'),
        ),
        centerTitle: true,
        actions: actions,
      ),
      body: body,
      floatingActionButton: fab,
    );
  }
}

