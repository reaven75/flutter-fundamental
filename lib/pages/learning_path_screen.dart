import 'package:flutter/material.dart';
import 'package:flutter_fundamental/model/dicoding_classes.dart';
import 'package:flutter_fundamental/utils/sliver_header_delegate.dart';
import 'package:flutter_fundamental/widget/ListtileItem.dart';

class LearningPathScreen extends StatelessWidget {
  const LearningPathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.medium(title: Text('Learning Path')),
          _header(context, 'Multi-Platform Development'),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ListTileItem(dicodingCourse: multiplatformPath[index]);
            }, childCount: multiplatformPath.length),
          ),
          _header(context, 'IOS Developher'),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ListTileItem(dicodingCourse: iosPath[index]);
            }, childCount: iosPath.length),

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          ),
          _header(context, 'Android Developer'),
          SliverList.builder(
            itemCount: androidPath.length,
            itemBuilder: (context, index) {
              return ListTileItem(dicodingCourse: androidPath[index]);
            },
          ),
          _header(context, 'Front-End Web Developer'),
          SliverGrid.count(
            crossAxisCount: 2,
          children: webPath
          .map((webClass) => ListTileItem(dicodingCourse: webClass))
          .toList()
          ),
        ],
      ),
    );
  }
}

SliverPersistentHeader _header(BuildContext context, String text) {
  return SliverPersistentHeader(
    pinned: true,
    delegate: SliverHeaderDelegate(
      minHeight: 60,
      maxHeight: 100,
      child: Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Center(
          child: Text(text, style: Theme.of(context).textTheme.bodyLarge),
        ),
      ),
    ),
  );
}
