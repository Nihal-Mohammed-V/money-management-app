import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(10),
      itemBuilder: (ctx, index) {
        return Card(
          elevation: 0,
          child: ListTile(
            leading: CircleAvatar(
              radius: 50,
              child: Text('10\nmay', textAlign: TextAlign.center),
            ),
            title: Text('10000'),
            subtitle: Text('Food'),
          ),
        );
      },
      separatorBuilder: (ctx, index) {
        return SizedBox(height: 1);
      },
      itemCount: 50,
    );
  }
}
