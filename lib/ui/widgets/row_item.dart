import 'package:ACApp/ui/widgets/separator.dart';
import 'package:flutter/material.dart';

import '../../util/index.dart';

/// ROW ITEM WIDGET
/// Stretched widget to display information in a 'Card Page' widget.
/// Contains a title and a description widget, which can be an icon or a text.
class RowItem extends StatelessWidget {
  final String title;
  final Widget description;

  RowItem(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        Expanded(
          flex: 6,
          child: Align(
            alignment: Alignment.centerRight,
            child: description,
          ),
        ),
      ],
    );
  }

  /// Builds a normal Text-to-Text row item
  factory RowItem.textRow(
    BuildContext context,
    String title,
    String description,
  ) {
    return RowItem(title, _getText(context, description));
  }

  factory RowItem.textRowColored(
    BuildContext context,
    String title,
    String description,
    Color color,
  ) {
    return RowItem(title, _getTextColored(context, description, false, color));
  }

  /// Builds a Text-to-Icon row item, to display a boolean status
  factory RowItem.iconRow(String title, bool status) {
    return RowItem(title, _getIcon(status));
  }


  /// Builds a Text-to-Icon row item, to display a boolean status
  factory RowItem.iconRowSet(String title, Icon icon) {
    return RowItem(title, icon);
  }

  /// Return an icon based on the [status] var
  static Widget _getIcon(bool status) {
    return Icon(
      status == null
          ? Icons.remove_circle
          : (status ? Icons.check_circle : Icons.cancel),
      color: status == null ? nullIcon : (status ? acceptIcon : denyIcon),
      size: 19,
    );
  }

  /// Returns a text description
  static Widget _getText(
    BuildContext context,
    String description, [
    bool clickable = false,
  ]) {
    return Text(
      description,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      textAlign: TextAlign.end,
      style: Theme.of(context).textTheme.subhead.copyWith(
            color: Theme.of(context).textTheme.caption.color,
            decoration:
                clickable ? TextDecoration.underline : TextDecoration.none,
          ),
    );
  }

  static Widget _getTextColored(
    BuildContext context,
    String description, [
    bool clickable = false,
    Color color,
  ]) {
    return Text(
      description,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      textAlign: TextAlign.end,
      style: Theme.of(context).textTheme.subhead.copyWith(
            color: color,
            decoration:
                clickable ? TextDecoration.underline : TextDecoration.none,
          ),
    );
  }
}
