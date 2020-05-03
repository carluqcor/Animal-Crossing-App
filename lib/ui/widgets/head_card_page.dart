import 'package:flutter/material.dart';
import 'index.dart';

/// HEAD CARD PAGE WIDGET
/// Widget used as page head in details pages, like 'Recipe Page' or 'Cocktail Page'.
class HeadCardPage extends StatelessWidget {
  final String title, imageUrl;
  final Widget body;
  final double witdh, height;
  final bool separator;

  HeadCardPage({
    @required this.title,
    @required this.imageUrl,
    @required this.body,
    this.witdh,
    this.height,
    this.separator,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(children: <Widget>[
          title != ''
              ? Row(children: <Widget>[
                  SizedBox(
                    width: witdh,
                    height: height,
                    child: CacheImage(imageUrl),
                  ),
                  Separator.spacer(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ])
              : SizedBox(
                  width: witdh,
                  height: height,
                  child: CacheImage(imageUrl),
                ),
          !separator ? Separator.none() : Separator.divider(),
          body,
        ]),
      ),
    );
  }
}
