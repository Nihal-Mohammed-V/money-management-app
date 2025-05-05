import 'package:flutter/material.dart';
import 'package:money_management_app/screens/category/expense_category_list.dart';
import 'package:money_management_app/screens/category/income_category_list.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          tabs: [Tab(text: 'Income'), Tab(text: 'Expense')],
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [IncomeCategoryList(), ExpenseCategoryList()],
          ),
        ),
      ],
    );
  }
}
