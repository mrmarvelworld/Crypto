import 'package:crypto/models/providers/coin.dart';
import 'package:crypto/screens/coin_screen.dart';
import 'package:crypto/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => CoinProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Coin App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        ),
        home: Consumer<CoinProvider>(
          builder: (ctx, coinProvider, _) {
            return FutureBuilder(
              future: coinProvider.loadData(),
              builder: (ctx, coinResultSnapShot) =>
                  coinResultSnapShot.connectionState == ConnectionState.waiting
                      ? CoinScreen()
                      : CoinScreen(),
            );
          },
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
