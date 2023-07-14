import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expensesList;
  const ExpensesList({super.key, required this.expensesList});
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: ((context, index) => ExpensesItem(expensesList[index])),
    );
  }
}
