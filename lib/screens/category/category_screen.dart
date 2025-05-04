import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

var TabController = _tabController;

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(tabs: [Tab(text: 'nihal'), Tab(text: 'abcd')]),
      ],
    );
  }
}
