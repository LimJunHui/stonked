import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stonked/stockProvider.dart';
import 'package:stonked/chartPage.dart';
import 'package:stonked/charts/charts.dart';
import 'package:stonked/stockTrade.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _stocks = ['stockA', 'stockB', 'stockC'];
    final _quantity = ['0', '0', '0'];
    var stockProvider = Provider.of<StockProvider>(context);

    return Scaffold(
      appBar: AppBar(
          title: Row(children: [
        Text('Stock List'),
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ChartPage()));
            },
            icon: Icon(Icons.monetization_on))
      ], mainAxisAlignment: MainAxisAlignment.spaceBetween)),
      body: Container(
        height: 600,
        alignment: Alignment.center,
        child: ListView(
          children: List.generate(_stocks.length, (index) {
            return InkWell(
              splashColor: Colors.blueAccent,
              highlightColor: Colors.blueAccent.withOpacity(1.0),
              onTap: () {
                // cartProvider.addToCart(index);
              },
              // child: _buildGridCards(index, 'assets/images/shoe_1.jpg',
              //     _stocks[index], _quantity[index], context),
              child: Card(
                color: Colors.lightBlueAccent[50],
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 140,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/shoe_1.jpg'),
                            fit: BoxFit.fitWidth,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'stockA',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '0',
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      child: Container(
                        child: const Icon(
                          Icons.add_circle,
                          color: Colors.black,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TradePage()
                              // imgPath: imgPath,
                              // stock: stockName,
                              // quantity: quantity,
                              // index: index)
                              ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildGridCards(
      int index, String imgPath, String stockName, String quantity, context) {
    return Card(
      color: Colors.lightBlueAccent[50],
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 140,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imgPath),
                  fit: BoxFit.fitWidth,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  stockName,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  quantity,
                  style: TextStyle(fontSize: 14.0),
                ),
              ],
            ),
          ),
          InkWell(
            child: Container(
              child: const Icon(
                Icons.add_circle,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TradePage()
                    // imgPath: imgPath,
                    // stock: stockName,
                    // quantity: quantity,
                    // index: index)
                    ),
              );
            },
          ),
        ],
      ),
    );
  }
}
