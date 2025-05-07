import 'package:flutter/material.dart';
import 'package:money_management_app/db/category/category_db.dart';
import 'package:money_management_app/models/category/category_model.dart';

ValueNotifier<CategoryType> selectedCategory = ValueNotifier(
  CategoryType.income,
);
Future<void> showCategoryAddPopup(BuildContext context) async {
  final _nameEditingContoller = TextEditingController();
  showDialog(
    context: context,
    builder: (ctx) {
      return SimpleDialog(
        title: Text('Add Category'),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _nameEditingContoller,
              decoration: InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                RadioButton(title: 'income', type: CategoryType.income),
                RadioButton(title: 'expense', type: CategoryType.expense),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                final _name = _nameEditingContoller.text;
                if (_name.isEmpty) {
                  return;
                }
                final _type = selectedCategory.value;
                final _category = CategoryModel(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  name: _name,
                  type: _type,
                );
                CategoryDb().insertCategory(_category);
                Navigator.of(ctx).pop();
              },
              child: Text('Add'),
            ),
          ),
        ],
      );
    },
  );
}

class RadioButton extends StatelessWidget {
  final String title;
  final CategoryType type;
  const RadioButton({super.key, required this.title, required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: selectedCategory,
          builder: (BuildContext ctx, CategoryType newCategory, Widget? _) {
            return Radio<CategoryType>(
              value: type,
              groupValue: selectedCategory.value,
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                selectedCategory.value = value;
                selectedCategory.notifyListeners();
              },
            );
          },
        ),
        Text(title),
      ],
    );
  }
}
