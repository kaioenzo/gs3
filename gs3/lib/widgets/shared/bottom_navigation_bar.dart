import 'package:flutter/material.dart';

Container bottomNavigationBar(BuildContext context) {
  return Container(
    height: 90,
    decoration: const BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(238, 219, 219, 0),
        ),
        BoxShadow(
          color: Color.fromRGBO(124, 124, 124, 0.4),
          spreadRadius: -5.0,
          blurRadius: 20.0,
        ),
      ],
      color: Color.fromRGBO(255, 255, 255, 1),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () {},
            child: const Column(
              children: [
                Icon(
                  Icons.home_outlined,
                  color: Color.fromRGBO(60, 106, 178, 1),
                  size: 35,
                ),
                Text(
                  'Home',
                  style: TextStyle(
                    color: Color.fromRGBO(60, 106, 178, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Column(
              children: [
                Icon(
                  Icons.article_outlined,
                  color: Color.fromRGBO(180, 180, 184, 1),
                  size: 35,
                ),
                Text(
                  'Fatura',
                  style: TextStyle(
                    color: Color.fromRGBO(180, 180, 184, 1),
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Column(
              children: [
                Icon(
                  Icons.credit_card_outlined,
                  color: Color.fromRGBO(180, 180, 184, 1),
                  size: 35,
                ),
                Text(
                  'Cartão',
                  style: TextStyle(
                    color: Color.fromRGBO(180, 180, 184, 1),
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Column(
              children: [
                Icon(
                  Icons.store_outlined,
                  color: Color.fromRGBO(180, 180, 184, 1),
                  size: 35,
                ),
                Text(
                  'Shop',
                  style: TextStyle(
                    color: Color.fromRGBO(180, 180, 184, 1),
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
