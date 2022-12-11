import 'package:currency_formatter/currency_formatter.dart';
const String cryptoUrl =
    "https://api.coingecko.com/api/v3/coins/markets?vs_currency=ngn&order=market_cap_desc&page=1&sparkline=false";
 CurrencyFormatterSettings nairaSettings = CurrencyFormatterSettings(
      symbol: 'NGN',
      symbolSide: SymbolSide.left,
      thousandSeparator: ',',
      decimalSeparator: '.',
      symbolSeparator: ' ',
    );