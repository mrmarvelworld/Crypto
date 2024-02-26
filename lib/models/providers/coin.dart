import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CoinProvider with ChangeNotifier {
  String _chartName = '';
  String _symbol = '';
  Map<dynamic, dynamic> _usd = {};
  Map<dynamic, dynamic> _eur = {};
  Map<dynamic, dynamic> _gbp = {};

  Future<bool> loadData() async {
    final url = Uri.https("api.coindesk.com", "/v1/bpi/currentprice.json");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        _chartName = responseData['chartName'];
        _usd = responseData['bpi']['USD'];
        _eur = responseData['bpi']['EUR'];
        _gbp = responseData['bpi']['GBP'];

        notifyListeners();
        return true;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw error;
    }
  }

  String get chartName {
    return _chartName;
  }

  Map<dynamic, dynamic> get usd {
    return _usd;
  }

  Map<dynamic, dynamic> get eur {
    return _eur;
  }

  Map<dynamic, dynamic> get gbp {
    return _gbp;
  }
}
