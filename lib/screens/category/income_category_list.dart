import 'package:flutter/material.dart';

class IncomeCategoryList extends StatelessWidget {
  const IncomeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (ctx, index) {
        return Card(
          child: ListTile(
            title: Text('Income Category $index'),
            trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
          ),
        );
      },
      itemCount: 100,
      separatorBuilder: (ctx, index) {
        return const SizedBox(height: 10);
      },
    );
  }
}
