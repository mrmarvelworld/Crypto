import 'dart:convert';

import 'package:crypto/models/providers/coin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoinScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final coin = Provider.of<CoinProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                children: <Widget>[
                  Text(
                    coin.chartName,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.star_border_outlined,
                        color: Colors.amber,
                      ),
                      SizedBox(width: 10),
                      Icon(
                        CupertinoIcons.xmark_circle_fill,
                        color: Colors.amber,
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            BalanceCard(),
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  _buildCurrencyRow(coin.usd),
                  _buildDivider(),
                  SizedBox(height: 20),
                  _buildCurrencyRow(coin.gbp),
                  _buildDivider(),
                  SizedBox(height: 20),
                  _buildCurrencyRow(coin.eur),
                  _buildDivider(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCurrencyRow(Map<dynamic, dynamic> currencyData) {
    return Row(
      children: <Widget>[
        Text(
          currencyData['description'],
          style: TextStyle(fontSize: 15),
        ),
        Spacer(),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: currencyData['code'],
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              TextSpan(
                text: ' ${currencyData['rate']}',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Divider(
      thickness: 2,
      color: Colors.grey.shade400,
    );
  }
}

class BalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final coin = Provider.of<CoinProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.amber,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          coin.chartName,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    "\$${coin.usd['rate']}",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
