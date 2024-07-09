import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SliverDemo extends StatefulWidget {
  const SliverDemo({super.key});

  @override
  State<SliverDemo> createState() => _SliverDemoState();
}

class _SliverDemoState extends State<SliverDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers:
           <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(title: Text("fdsf"),),
            ),
             SliverToBoxAdapter(child: Container(color: Colors.red,),)
          ],
      ),
    );;
  }
}
