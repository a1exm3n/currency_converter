# currency_converter

A flutter mobile app, which converts amounts from one currency to another using a fixed currency exchange rate table.
All amounts are simultaneously updated with any changes in the input (no need to press 'convert' button).

## Funtionality
- Amount input (doubles are supported)
- Choosing the "from" and "to" currency (USD, EUR, GBP, RUB, KES)
- The "Swap" button changes the "from" and "to" currencies in one click
- Displays the converted amount and the exchange rate (e.g. 1 USD = 0.79 GBP)

## Currency Excahnge rates
Currency exchange rates are stored in 'lib/data/exchange_rates.dart' and are indicated **relative to USD**. 
They are fixed, the app does not use any kind of API, as per the requirements.

Since all the currency rates are relative to USD, the rate between any two currencies is 'to_ currency'/'from_currency'.

## Project structure
- 'lib/main.dart' is responsible for the UI and the screen state (amounts, picked currencies)
- 'lib/data/exchange_rates.dart' as described earlier a fixed table with exchange rate
- 'lib/logic/currency_converter.dart' convertation logic

## Edge cases
- Null handling for blank input (using ??)
- Converteds amount is showed with 4 digits after coma to ensure small amounts like 1 KES -> 0.0077 are not dsiplayed as 0.01

## AI declaration and sources
Materials from the course were used while developing this app. Escpecially lab 2. Claude was used for explaining some design features.
However, the submitted code is my own work.