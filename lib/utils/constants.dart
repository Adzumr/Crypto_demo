import 'package:currency_formatter/currency_formatter.dart';

const String currencyApi = "036ef26d84msh76b79e29a8a7169p1d6dd1jsn7b21779df3a3";
const String cryptoUrl =
    "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&page=1&sparkline=false";
const String currencyUrl =
    "https://currency-exchange.p.rapidapi.com/exchange?from=USD&to=NGN&q=1.0";
 CurrencyFormatterSettings nairaSettings = CurrencyFormatterSettings(
      symbol: 'NGN',
      symbolSide: SymbolSide.left,
      thousandSeparator: ',',
      decimalSeparator: '.',
      symbolSeparator: ' ',
    );