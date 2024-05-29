import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gs3/models/account.dart';
import 'package:gs3/provider/account_provider.dart';
import 'package:gs3/widgets/shared/default_divider.dart';
import 'package:provider/provider.dart';

class LastBuys extends StatefulWidget {
  const LastBuys({super.key});

  @override
  State<LastBuys> createState() => _LastBuysState();
}

class _LastBuysState extends State<LastBuys> {
  @override
  Widget build(BuildContext context) {
    final accountProvider = Provider.of<AccountProvider>(context);

    final transactionsByDate = groupBy(accountProvider.selectedAccount.transactions, (Transaction t) {
      return DateTime(t.date.year, t.date.month, t.date.day);
    });

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Últimos lançamentos',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerRight,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Ver todos',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Color.fromRGBO(0, 0, 0, 0.7),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    alignment: Alignment.centerLeft,
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color.fromRGBO(40, 144, 207, 1),
                    ),
                  ),
                ],
              )
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: transactionsByDate.keys.length,
            itemBuilder: (context, index) {
              final date = transactionsByDate.keys.elementAt(index);
              final transactions = transactionsByDate[date];

              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions!.first.formattedDateTitle,
                      style: const TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(40, 144, 207, 1),
                      ),
                    ),
                    Column(
                      children: transactions.map((Transaction transaction) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10.0, 20.0, 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 52,
                                        height: 52,
                                        child: Icon(
                                          transaction.icon,
                                          size: 28,
                                          color: const Color.fromRGBO(60, 106, 178, 1),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: .0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              transaction.description,
                                              style: const TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w700,
                                                color: Color.fromRGBO(33, 33, 33, 1),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 3.0),
                                              child: Text(
                                                transaction.formattedDate,
                                                style: const TextStyle(
                                                  fontSize: 11.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromRGBO(105, 105, 107, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        transaction.formattedAmount,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4.0),
                                        child: Text(
                                          transaction.formattedParcels,
                                          style: const TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w700,
                                            color: Color.fromRGBO(130, 130, 133, 1),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const DefaultDivider(),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
