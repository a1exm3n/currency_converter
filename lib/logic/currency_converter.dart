import 'package:currency_converter/data/exchange_rates.dart';

/// Helper function to get the rate. Returns null if there is no such currency
double? getExchangeRate(String fromCurrency, String toCurrency) {
  double? fromRate = exchangeRates[fromCurrency];
  double? toRate = exchangeRates[toCurrency];
  if (fromRate == null || toRate == null) {
    return null;
  }
  return toRate / fromRate; // exchange rates stored relative to USD, so we use it to convert
}

/// Converts the amount from one currency to another. Can return null if either currency is not listed in the exchange rates
double? convertCurrency(String fromCurrency, String toCurrency, double amount) {
  double? rate = getExchangeRate(fromCurrency, toCurrency);
  if (rate == null) {
    return null;
  }
  return amount * rate;
}

