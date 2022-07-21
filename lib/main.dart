import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'pages/Masonry_page.dart';
import 'pages/Staggered_page.dart';
import 'pages/aligned_page.dart';
import 'pages/quilated_page.dart';
import 'pages/staired_page.dart';
import 'pages/woven_page.dart';


void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GridView(),
  )
);

class GridView extends StatefulWidget {
  const GridView({Key? key}) : super(key: key);

  @override
  State<GridView> createState() => _GridViewState();
}

class _GridViewState extends State<GridView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: const Text('Staggered Grid View')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(height: 10),
              MenuEntry(
                title: 'Staggered',
                imageName: 'staggered',
                destination: StaggeredPage(),
              ),
              SizedBox(height: 10),
              MenuEntry(
                title: 'Masonry',
                imageName: 'masonry',
                destination: MasonryPage(),
              ),
              SizedBox(height: 10),
              MenuEntry(
                title: 'Quilted',
                imageName: 'quilted',
                destination: QuiltedPage(),
              ),
              SizedBox(height: 10),
              MenuEntry(
                title: 'Woven',
                imageName: 'woven',
                destination: WovenPage(),
              ),
              SizedBox(height: 10),
              MenuEntry(
                title: 'Staired',
                imageName: 'staired',
                destination: StairedPage(),
              ),
              SizedBox(height: 10),
              MenuEntry(
                title: 'Aligned',
                imageName: 'aligned',
                destination: AlignedPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuEntry extends StatelessWidget {
  const MenuEntry({
    Key? key,
    required this.title,
    required this.imageName,
    required this.destination,
  }) : super(key: key);

  final String title;
  final Widget destination;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => destination,
            ),
          );
        },
        child: Stack(
          children: [
            Image.network(
              'https://images.unsplash.com/photo-1658255324897-b9baad60acd2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
              fit: BoxFit.fill,
            ),
            Positioned.fill(
              child: FractionallySizedBox(
                heightFactor: 0.25,
                alignment: Alignment.bottomCenter,
                child: ColoredBox(
                  color: Colors.black.withOpacity(0.75),
                  child: Center(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}