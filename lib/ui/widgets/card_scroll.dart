import 'package:flutter/material.dart';

import '../pages/index.dart';
import 'cache_image.dart';
import 'separator.dart';

/// CARD SCROLL
/// This widgets allows users to select recipes or cocktails from a list.
/// It also presents the first four ones in the main view.
class CardScroll extends StatelessWidget {
  final String title;
  final List children, displayChildren;

  CardScroll({
    this.title,
    this.children,
    this.displayChildren,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context).textTheme.subhead.copyWith(
                        color: Theme.of(context).textTheme.subhead.color,
                      ),
                ),
              ],
            ),
            Separator.spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: displayChildren,
            )
          ],
        ),
      ),
    );
  }

  factory CardScroll.villager({
    BuildContext context,
    String title,
    List children,
  }) {
    return CardScroll(
      title: title,
      children: children,
      displayChildren: children
          .sublist(0, 4)
          .map((villager) => ScrollItem(
                url: villager.photo,
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => VillagerPage(villager)),
                    ),
              ))
          .toList(),
    );
  }
}

class ScrollItem extends StatelessWidget {
  final String url;
  final VoidCallback onTap;

  ScrollItem({this.url, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 64,
      child: InkWell(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: CacheImage(url),
        ),
        onTap: onTap,
      ),
    );
  }
}
