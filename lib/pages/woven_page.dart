import 'dart:math';

import '../common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WovenPage extends StatefulWidget {
  const WovenPage({
    Key? key,
  }) : super(key: key);

  @override
  State<WovenPage> createState() => _WovenPageState();
}

class _WovenPageState extends State<WovenPage> {
  final rnd = Random();
  late List<int> extents;
  int crossAxisCount = 4;

  @override
  void initState() {
    super.initState();
    extents = List<int>.generate(10000, (int index) => rnd.nextInt(7) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Woven')),
      body: GridView.custom(
  gridDelegate: SliverWovenGridDelegate.count(
    crossAxisCount: 2,
    mainAxisSpacing: 8,
    crossAxisSpacing: 8,
    pattern: [
      WovenGridTile(1),
      WovenGridTile(
        5 / 7,
        crossAxisRatio: 0.9,
        alignment: AlignmentDirectional.centerEnd,
      ),
    ],
  ),
  childrenDelegate: SliverChildBuilderDelegate(
    (context, index) => Tile(index: index),
  ),
),
    );
  }
}