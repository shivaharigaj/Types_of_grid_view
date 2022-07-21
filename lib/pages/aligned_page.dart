import 'dart:math';

import '../common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AlignedPage extends StatefulWidget {
  const AlignedPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AlignedPage> createState() => _AlignedPageState();
}

class _AlignedPageState extends State<AlignedPage> {
  final rnd = Random();
  late List<int> extents;
  int crossAxisCount = 4;

  @override
  void initState() {
    super.initState();
    extents = List<int>.generate(50, (int index) => rnd.nextInt(7) + 1);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aligned')),
      body: AlignedGridView.count(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        
        itemBuilder: (context, index) {
          final height = extents[index] * 40;
          return ImageTile(
            index: index,
            width: 100,
            height: height,
          
          );
        },
        itemCount: extents.length,
        
      ),
       
    );
  }
}