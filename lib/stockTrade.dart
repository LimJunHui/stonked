import 'package:flutter/material.dart';
import 'package:stonked/listPage.dart';
import 'package:stonked/stockProvider.dart';
import 'package:provider/provider.dart';


class TradePage extends StatefulWidget {
  // final String imgPath;
  // final String stock;
  // final String quantity;
  // final int index;
  const TradePage({Key key})
      : super(key: key);
  State<TradePage> createState() => TradePageState();
}

class TradePageState extends State<TradePage> {
  @override
  Widget build(BuildContext context) {
    var stockProvider = Provider.of<StockProvider>(context);
    String stockChosen = "stockA";
    int quantity;
    var cartProvider = Provider.of<StockProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Buy/Sell Stocks'),
        ),
        body: Center(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/shoe_1.jpg'),
                height: 300,
                width: 300,
              ),
              Row(
              children: [
                const Text('Choose stock'),
                DropdownButton(
                  value: stockChosen,
                  icon: const Icon(Icons.arrow_drop_down),
                  onChanged: (String value) {
                    setState(() {
                      stockChosen = value;
                    });
                  },
                  items: <String>['stockA', 'stockB', 'stockC']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
              Text('Quantity'),
              ConstrainedBox(
                constraints: BoxConstraints.tight(const Size(150, 25)),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'How much to trade',
                    labelText: 'Quantity',
                  ),
                  onSaved: (String value) {
                    quantity = int.parse(value);
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                child:
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      stockProvider.addToStock(stockChosen, quantity);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListPage(),
                        ),
                      );
                    },
                    child: const Text('Buy'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      stockProvider.minusToStock(stockChosen, quantity);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListPage(),
                        ),
                      );
                    },
                    child: const Text('Sell'),
                  )
                ],
              ))
            ],
          ),
        )));
  }
}
