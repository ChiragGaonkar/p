// ignore_for_file: file_names

import 'package:cryptoapp/crypto_currency.dart';
import 'package:cryptoapp/models/assets_model.dart';
import 'package:cryptoapp/screens/settings_screen.dart';
import 'package:cryptoapp/services/remote_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // List<Assets>? Currency;
  // var isLoaded = false;

  // @override
  // void initState() {
  //   super.initState();
  //   //fetch data
  //   getData();
  // }

  // getData() async {
  //   Currency = await RemoteService().getCurrencyDetails();
  //   if (Currency != null) {
  //     setState(() {
  //       isLoaded = true;
  //     });
  //   } else {
  //     Container(
  //       child: Text('Not Retrievd'),
  //     );
  //   }
  // }

  //List for CryptoCurrency
  List<CryptoCurrency> Currency = [];
  //List for CountryCurrency
  List listCountryCurrency = [];

  //Function to store CryptoCurrency in List
  void getCurrencyDetails(String name, double value, double rate) {
    var curr = CryptoCurrency(name: name, priceUsd: value, volume1HrsUsd: rate);
    Currency.add(curr);
  }

  //Function to store CountryCurrency in List
  void getCountryCurrency(String curr) {
    listCountryCurrency.add(curr);
  }

  //Function to Navigate to next Page.
  void openSettingPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(SettingScreen.routeName);
  }

  //List of Colors for Circle Avatar
  List colors = [Colors.blue, Colors.deepPurple, Colors.deepOrange];

  @override
  Widget build(BuildContext context) {
    String valueChoose;
    getCurrencyDetails('Bitcoin', 2000.0, 0.2453);
    getCurrencyDetails('VeriCoin', 300.0, 0.236);
    getCurrencyDetails('Vanywhere', 4000.0, 0.33);
    getCurrencyDetails('Auctus', 1000.0, 0.923);
    getCurrencyDetails('Covesting', 4532.0, 0.1325);

    getCountryCurrency('USD');
    getCountryCurrency('INR');
    getCountryCurrency('EUR');
    getCountryCurrency('AUD');
    getCountryCurrency('AFN');
    getCountryCurrency('CAD');
    getCountryCurrency('KWD');
    getCountryCurrency('NZD');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto App'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            onPressed: () => openSettingPage(context),
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Visibility(
        //visible: isLoaded,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: colors[index % 3],
                        child: Text(
                          Currency[index].name.substring(0, 1),
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        radius: 30,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Currency[index].name,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            '\$' + Currency[index].priceUsd.toString(),
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            '1 hour = ' +
                                Currency[index].volume1HrsUsd.toString() +
                                '%',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                itemCount: Currency.length,
              ),
            ),
            DropdownButton(
              hint: Text(
                'Select Currency',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              //value: valueChoose,
              onChanged: (newValue) {
                valueChoose = newValue as String;
              },
              items: listCountryCurrency.map((valueItem) {
                return DropdownMenuItem(
                  child: Text(valueItem),
                  value: valueItem,
                );
              }).toList(),
            )
          ],
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
