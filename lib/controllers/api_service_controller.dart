import 'dart:convert';
import 'dart:developer';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

import '../models/coin_model.dart';
import '../utils/constants.dart';

class ApiServiceController extends GetxController {
  CoinModel? coinModel;
  List<CoinModel>? coinList;
  double? nairaPrice;
  Future getCurrency() async {
    final header = {
      "X-RapidAPI-Key": currencyApi,
    };

    log("currency data Loading...");
    try {
      final response = await http.get(
        Uri.parse(currencyUrl),
        headers: header,
      );
      if (response.statusCode == 200) {
        nairaPrice = double.tryParse(response.body);
        log("Naira: $nairaPrice");
      } else {
        log(response.body);
      }
    } on Exception catch (e) {
      log("Exception: $e");
    } finally {
      log("done...");
    }
  }

  Future getCryptoData() async {
    log("Loading...");
    try {
      final response = await http.get(
        Uri.parse(cryptoUrl),
      );
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        coinList = [];
        for (var name in result) {
          if (name["name"] == "Bitcoin" ||
              name["name"] == "Ethereum" ||
              name["name"] == "XRP" ||
              name["name"] == "Dogecoin" ||
              name["name"] == "Litecoin" ||
              name["name"] == "Dash") {
            CoinModel coinModel = CoinModel(
              currentPrice: name["current_price"],
              image: name["image"],
              name: name["name"],
            );
            coinList!.add(coinModel);
          }
        }
        log(coinList!.length.toString());
      }
    } on Exception catch (e) {
      log("Exception: $e");
    } finally {
      log("done...");
    }
    return coinList;
  }
}
