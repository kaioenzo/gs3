import 'package:flutter/material.dart';
import 'package:gs3/provider/account_provider.dart';
import 'package:gs3/services/account_service.dart';
import 'package:provider/provider.dart';

class AccountCarousel extends StatefulWidget {
  const AccountCarousel({super.key});

  @override
  State<AccountCarousel> createState() => _AccountCarouselState();
}

class _AccountCarouselState extends State<AccountCarousel> {
  PageController pageController = PageController();
  final AccountService _accountService = AccountService();

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: context.read<AccountProvider>().selectedIndex,
      viewportFraction: 0.8,
    );
    context.read<AccountProvider>().fetchAndAddAccounts();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accountProvider = Provider.of<AccountProvider>(context);
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: pageController,
        onPageChanged: (page) {
          accountProvider.selectAccount(page);
        },
        scrollDirection: Axis.horizontal,
        itemCount: accountProvider.accounts.length,
        itemBuilder: (ctx, index) {
          final account = accountProvider.accounts[index];
          return GestureDetector(
            onTap: () {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              accountProvider.selectAccount(index);
            },
            child: SizedBox(
              width: 300,
              child: Card(
                child: Column(
                  children: [
                    Text(account.name),
                    Text('R\$ ${account.balanceAmmount.toStringAsFixed(2)}'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
