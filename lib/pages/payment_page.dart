import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cart/cart_model.dart';
import '../cart/cart_provider.dart';
import '../database/db_helper.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Payment History'),
        centerTitle: true,
        actions: const [
          //pay
          Center(
            child: Icon(
              Icons.payment,
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            FutureBuilder(
              future: cart.getData(),
              builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          const Image(
                            image: AssetImage('assets/images/pay.png'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Tidak ada pembayaran',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Anda belum melakukan transaksi dan\nbelum ada pemebelian produk untuk hari ini',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.subtitle2,
                          )
                        ],
                      ),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    snapshot.data![index].quantity.toString(),
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Sayur (' +
                                          snapshot.data![index].productName
                                              .toString() +
                                          ')',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Consumer<CartProvider>(
                                        builder: (context, value, child) {
                                      return Visibility(
                                        visible: value
                                                    .getTotalPrice()
                                                    .toStringAsFixed(2) ==
                                                "0.00"
                                            ? false
                                            : true,
                                        child: ReusableWidget(
                                          title: 'Total ',
                                          value: 'Rp. ' +
                                              value
                                                  .getTotalPrice()
                                                  .toStringAsFixed(2),
                                        ),
                                      );
                                    }),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }
                }
                return const Text('');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableWidget extends StatelessWidget {
  final String title, value;
  // ignore: use_key_in_widget_constructors
  const ReusableWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 15, color: Colors.grey),
        ),
        Text(
          value.toString(),
          style: const TextStyle(fontSize: 15, color: Colors.grey),
        )
      ],
    );
  }
}
