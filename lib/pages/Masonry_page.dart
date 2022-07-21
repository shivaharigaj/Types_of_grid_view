import 'dart:math';

import '../common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MasonryPage extends StatefulWidget {
  const MasonryPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MasonryPage> createState() => _MasonryPageState();
}

class _MasonryPageState extends State<MasonryPage> {
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
      appBar: AppBar(title: const Text('Masonry')),
      body: MasonryGridView.count(
  crossAxisCount: 4,
  mainAxisSpacing: 4,
  crossAxisSpacing: 4,
  itemBuilder: (context, index) {
    return Tile(
      index: index,
      extent: (index % 5 + 1) * 100,
    );
  },
),
    );
  }
}