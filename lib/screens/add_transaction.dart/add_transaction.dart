import 'package:flutter/material.dart';
import 'package:money_management_app/db/category/category_db.dart';
import 'package:money_management_app/models/category/category_model.dart';

class AddTransaction extends StatefulWidget {
  static const routeName = 'add-transaction';
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  DateTime? _selectedDate;
  CategoryType? _selectedCategory;
  CategoryModel? _selectedCategoryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Purpose',
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Amount',
                ),
              ),
              SizedBox(height: 16),

              //date
              TextButton.icon(
                onPressed: () async {
                  final _selectedDateTemp = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now().subtract(
                      const Duration(days: 30),
                    ),
                    lastDate: DateTime.now(),
                    initialDate: DateTime.now(),
                  );
                  if (_selectedDateTemp == null) {
                    return;
                  } else {
                    print(_selectedDateTemp.toString());
                    setState(() {
                      _selectedDate = _selectedDateTemp;
                    });
                  }
                },
                icon: Icon(Icons.calendar_today),
                label: Text(
                  _selectedDate == null
                      ? 'Selected Date'
                      : _selectedDate.toString(),
                ),
              ),

              //Category
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: false,
                        groupValue: CategoryType.income,
                        onChanged: (newValue) {},
                      ),
                      Text('Income'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: false,
                        groupValue: CategoryType.expense,
                        onChanged: (newValue) {},
                      ),
                      Text('Expense'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              DropdownButton(
                hint: Text('Select Category'),
                items:
                    CategoryDb().expenseCategoryList.value.map((e) {
                      return DropdownMenuItem(value: e.id, child: Text(e.name));
                    }).toList(),
                onChanged: (selectedValue) {},
              ),
              SizedBox(height: 16),
              ElevatedButton(onPressed: () {}, child: Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}
