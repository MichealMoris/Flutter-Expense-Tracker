import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpense = [];

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpense.indexOf(expense);
    setState(() {
      _registeredExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(
          seconds: 2,
        ),
        content: const Text('Expense deleted successfully.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpense.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  void _addNewExpense(Expense newExpense) {
    setState(() {
      _registeredExpense.add(newExpense);
    });
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(_addNewExpense),
    );
  }

  @override
  Widget build(context) {
    Widget _originalContent = const Center(
      child: Text('There is no Expenses. Let\'s add some.'),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: const Icon(
                Icons.add,
              )),
        ],
      ),
      body: Column(
        children: [
          const Text('The Chart...'),
          Expanded(
            child: _registeredExpense.isEmpty
                ? _originalContent
                : ExpensesList(
                    expensesList: _registeredExpense,
                    onRemoveExpense: _removeExpense,
                  ),
          ),
        ],
      ),
    );
  }
}
