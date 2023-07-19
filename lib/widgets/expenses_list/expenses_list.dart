import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expensesList;
  final void Function(Expense expense) onRemoveExpense;
  const ExpensesList(
      {super.key, required this.expensesList, required this.onRemoveExpense});
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: ((context, index) => Dismissible(
            key: ValueKey(expensesList[index]),
            child: ExpensesItem(
              expensesList[index],
            ),
            onDismissed: (direction) {
              onRemoveExpense(expensesList[index]);
            },
          )),
    );
  }
}
