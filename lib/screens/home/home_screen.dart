import 'package:flutter/material.dart';
import 'package:money_management_app/screens/category/category_add.dart';
import 'package:money_management_app/screens/category/category_screen.dart';
import 'package:money_management_app/screens/home/widgets/bottom_navigation.dart';
import 'package:money_management_app/screens/transactions/transaction.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);
  final _pages = [TransactionScreen(), CategoryScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('MONEY MANAGER'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      bottomNavigationBar: BottomNavigationMM(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (BuildContext context, int updatedIndex, _) {
            return _pages[updatedIndex];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            print('add transaction');
          } else {
            print('add categories');
            showCategoryAddPopup(context);
            // final sample = CategoryModel(
            //   id: DateTime.now().millisecondsSinceEpoch.toString(),
            //   name: 'food',
            //   type: CategoryType.expense,
            // );
            // CategoryDb().insertCategory(sample);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
