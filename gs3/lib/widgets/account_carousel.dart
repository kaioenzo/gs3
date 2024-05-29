import 'package:flutter/material.dart';
import 'package:gs3/provider/account_provider.dart';
import 'package:provider/provider.dart';

class AccountCarousel extends StatefulWidget {
  const AccountCarousel({super.key});

  @override
  State<AccountCarousel> createState() => _AccountCarouselState();
}

class _AccountCarouselState extends State<AccountCarousel> {
  PageController pageController = PageController();
  bool showCardInfo = false;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: context.read<AccountProvider>().selectedIndex, viewportFraction: 0.9);
    context.read<AccountProvider>().fetchAndAddAccounts();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  String formatCardNumber(String cardNumber) {
    if (showCardInfo) {
      return cardNumber;
    } else {
      String lastFourDigits = cardNumber.substring(cardNumber.length - 4);
      return '**** **** **** $lastFourDigits';
    }
  }

  LinearGradient getCustomGradient(int index) {
    return index % 2 == 0
        ? const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF2B66BC),
              Color(0xFF132D55),
            ],
            stops: [0.0006, 0.9991],
          )
        : const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(0, 73, 75, 1),
              Color.fromRGBO(0, 73, 75, 1),
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    final accountProvider = Provider.of<AccountProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: SizedBox(
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
                height: 140,
                child: Container(
                  margin: const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    gradient: getCustomGradient(index),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 88,
                                height: 56,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    formatCardNumber(account.creditCardNumber),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    account.name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                color: const Color.fromRGBO(8, 158, 227, 1),
                                onPressed: () {
                                  setState(() {
                                    showCardInfo = !showCardInfo;
                                  });
                                },
                                icon: Icon(showCardInfo ? Icons.visibility_off : Icons.visibility),
                              )
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: Divider(
                              color: Color.fromRGBO(54, 96, 161, 1),
                              thickness: 1.0,
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Limite disponível',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                    Text(
                                      'R\$ ${account.balanceAmmount.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Text(
                                      'Melhor dia de compra',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                    Text(
                                      account.betterDayToBuy,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
