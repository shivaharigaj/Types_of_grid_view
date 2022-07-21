import 'dart:math';

import '../common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StairedPage extends StatefulWidget {
  const StairedPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StairedPage> createState() => _StairedPageState();
}

class _StairedPageState extends State<StairedPage> {
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
      appBar: AppBar(title: const Text('Staired')),
      body: GridView.custom(
  gridDelegate: SliverStairedGridDelegate(
    crossAxisSpacing: 48,
    mainAxisSpacing: 24,
    startCrossAxisDirectionReversed: true,
    pattern: [
      StairedGridTile(0.5, 1),
      StairedGridTile(0.5, 3 / 4),
      StairedGridTile(1.0, 10 / 4),
    ],
  ),
  childrenDelegate: SliverChildBuilderDelegate(
    (context, index) => Tile(index: index),
  ),
),
    );
  }
}