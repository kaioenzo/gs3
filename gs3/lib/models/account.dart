import 'package:flutter/material.dart';

class Account {
  final String id;
  final String name;
  final double balanceAmmount;
  final String betterDayToBuy;
  final String creditCardNumber;
  final List<Transaction> transactions;

  Account({
    required this.id,
    required this.name,
    required this.balanceAmmount,
    required this.betterDayToBuy,
    required this.creditCardNumber,
    required this.transactions,
  });
}

class Transaction {
  final String id;
  final String description;
  final double amount;
  final DateTime date;
  final int parcels;
  final Icon icon;

  String get formattedDate {
    return '${date.day}/${date.month} as /${date.hour}:${date.minute}';
  }

  String get formattedAmount {
    return 'R\$ ${amount.toStringAsFixed(2)}';
  }

  String get formattedParcels {
    return parcels > 1 ? 'em ${parcels}x' : '';
  }

  Transaction({
    required this.id,
    required this.description,
    required this.amount,
    required this.parcels,
    required this.date,
    required this.icon,
  });
}
