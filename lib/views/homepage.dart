import 'dart:math';

import 'package:flutter/material.dart';
import 'package:media_player/views/video_screen.dart';

import 'music_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Player'),
        bottom: TabBar(
          labelColor:
              Colors.primaries[Random().nextInt(Colors.primaries.length)],
          automaticIndicatorColorAdjustment: true,
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
          controller: tabController,
          tabs: const [
            Tab(text: 'Music'),
            Tab(text: 'Videos'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          MusicScreen(),
          VideosScreen(),
        ],
      ),
    );
  }
}
