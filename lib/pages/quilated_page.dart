import 'dart:math';

import '../common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class QuiltedPage extends StatefulWidget {
  const QuiltedPage({
    Key? key,
  }) : super(key: key);

  @override
  State<QuiltedPage> createState() => _QuiltedPageState();
}

class _QuiltedPageState extends State<QuiltedPage> {
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
      appBar: AppBar(title: const Text('Quilated')),
      body: GridView.custom(
  gridDelegate: SliverQuiltedGridDelegate(
    crossAxisCount: 4,
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    repeatPattern: QuiltedGridRepeatPattern.inverted,
    pattern: [
      QuiltedGridTile(2, 2),
      QuiltedGridTile(1, 1),
      QuiltedGridTile(1, 1),
      QuiltedGridTile(1, 2),
    ],
  ),
  childrenDelegate: SliverChildBuilderDelegate(
    (context, index) => Tile(index: index),
  ),
),
    );
  }
}