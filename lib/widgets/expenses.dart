import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> registerExpense = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Breakfast',
      amount: 5.86,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
              )),
        ],
      ),
      body: Column(
        children: [
          const Text('The Chart...'),
          Expanded(
            child: ExpensesList(expensesList: registerExpense),
          ),
        ],
      ),
    );
  }
}
