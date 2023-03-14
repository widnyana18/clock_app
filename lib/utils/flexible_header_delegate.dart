import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

class FlexibleHeaderDelegate extends SliverPersistentHeaderDelegate {
  FlexibleHeaderDelegate(this.maxHeight);
  final double maxHeight;

  @override
  double get minExtent => 50;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    var theme = Theme.of(context);
    var isCollapse = shrinkOffset > maxExtent / 4;

    return SizedBox.expand(
      child: Container(
        color: theme.backgroundColor,
        // elevation: isCollapse ? 16 : 0,
      ),
    );
  }

  @override
  bool shouldRebuild(FlexibleHeaderDelegate oldDelegate) => true;
}
