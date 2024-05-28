import 'dart:async';
import 'package:gs3/models/account.dart';

class AccountService {
  Future<List<Account>> fetchNewAccounts() async {
    await Future.delayed(const Duration(seconds: 2));

    List<Account> newAccounts = [
      Account(
          id: '2',
          name: 'Nova Conta 1',
          balanceAmmount: 1234.56,
          transactions: [
            Transaction(
                id: '4', description: 'Compra 1', amount: 349.99, date: DateTime(2024, DateTime.may, 24), parcels: 3),
            Transaction(
                id: '5', description: 'Compra 2', amount: 50.00, date: DateTime(2024, DateTime.may, 24), parcels: 1),
            Transaction(
                id: '6', description: 'Compra 3', amount: 17.65, date: DateTime(2024, DateTime.may, 22), parcels: 1),
          ],
          betterDayToBuy: '22',
          creditCardNumber: '1234 5678 9012 3456'),
      Account(
          id: '3',
          name: 'Nova Conta 2',
          balanceAmmount: 7890.12,
          transactions: [
            Transaction(id: '6', description: 'Compra 3', amount: 200.00, date: DateTime.now(), parcels: 2),
            Transaction(
                id: '7', description: 'Compra 4', amount: 150.00, date: DateTime(2024, DateTime.may, 22), parcels: 1),
            Transaction(
                id: '7', description: 'Compra 4', amount: 73.32, date: DateTime(2024, DateTime.may, 22), parcels: 1),
          ],
          betterDayToBuy: '14',
          creditCardNumber: '1234 5678 9012 3456'),
    ];

    return newAccounts;
  }
}
