import 'package:flutter/material.dart';
import '../models/account.dart';

class AccountProvider with ChangeNotifier {
  // start with a single account
  final List<Account> _accounts = [
    Account(
      id: '1',
      name: 'GS3 Tec',
      balanceAmmount: 7867.80,
      betterDayToBuy: '20',
      creditCardNumber: '1234 5678 9012 3456',
      transactions: [
        Transaction(
          id: '1',
          description: 'Apple',
          amount: 549.99,
          parcels: 12,
          date: DateTime.now(),
        ),
        Transaction(
          id: '2',
          description: 'Uber*Uber*Trip',
          amount: 12.96,
          parcels: 1,
          date: DateTime.now(),
        ),
      ],
    ),
  ];

  // start with the first account selected as default
  int _selectedIndex = 0;

  List<Account> get accounts => _accounts;
  Account get selectedAccount => _accounts[_selectedIndex];
  int get selectedIndex => _selectedIndex;

  void addAccount(Account account) {
    _accounts.add(account);
    notifyListeners();
  }

  void selectAccount(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
