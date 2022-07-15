import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cart/cart_model.dart';
import '../cart/cart_provider.dart';
import '../database/db_helper.dart';

import '../read_data/read_data.dart';
import 'cart_page.dart';
import 'payment_page.dart';
import 'profile_page.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  String search = '';
  TextEditingController searchController = TextEditingController();

  List<String> productName = [
    'Gelas',
    'Gelas Kupu',
    'Gelas Besar',
    'Guci',
    'Mangkok',
    'Mangkok Mini',
    'Mangkok Couple',
    'Kuali Gule',
    'Kuali Mini',
    'Kuali Besar',
    'Kuali Sup',
    'Kendi Besar',
    'Wajan Besar',
    'Wajan Kecil',
    'Piring',
    'Pot Bunga Bulat',
    'Pot Bunga Tinggi',
    'Mangkok Dan Sendok',
    'Peralatan Makan',
    'Peralatan Ngeteh',
    'Teko Dan Tungku',
    'Teko',
    'Wajan Serabi'
  ];
  List<String> productUnit = [
    '1 Pcs',
    '1 Pcs',
    '1 Pcs',
    '1 Pcs',
    '1 Pcs',
    '2 Pcs',
    '1 Set',
    '1 Pcs',
    '1 Pcs',
    '1 Pcs',
    '1 Pcs',
    '1 Pcs',
    '1 Pcs',
    '1 Pcs',
    '1 Pcs',
    '3 Pcs',
    '2 Pcs',
    '1 Set',
    '1 Set',
    '1 Set',
    '1 Set',
    '1 Pcs',
    '1 Set',
  ];
  List<int> productPrice = [
    10000,
    12000,
    18000,
    96000,
    13350,
    15500,
    32000,
    21450,
    20500,
    35000,
    28250,
    112000,
    58000,
    41400,
    8000,
    22000,
    25500,
    18000,
    89000,
    72000,
    152000,
    61540,
    74000
  ];
  List<String> productImage = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg',
    'assets/images/7.jpg',
    'assets/images/8.jpg',
    'assets/images/9.jpg',
    'assets/images/10.jpg',
    'assets/images/11.jpg',
    'assets/images/12.jpg',
    'assets/images/13.jpg',
    'assets/images/14.jpg',
    'assets/images/15.jpg',
    'assets/images/16.jpg',
    'assets/images/17.jpg',
    'assets/images/18.jpg',
    'assets/images/19.jpg',
    'assets/images/20.jpg',
    'assets/images/21.jpg',
    'assets/images/22.jpg',
    'assets/images/23.jpg',
  ];

  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
        actions: const [
          //pay
          Center(
            child: Icon(
              Icons.home_outlined,
            ),
          ),
          SizedBox(width: 20.0),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: searchController,
              cursorColor: Colors.brown,
              style: TextStyle(color: Colors.black.withOpacity(0.9)),
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(
                  Icons.search_outlined,
                  color: Colors.brown,
                ),
                labelText: "Search",
                labelStyle: TextStyle(
                  color: Colors.brown.withOpacity(0.9),
                ),
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor: Colors.brown.withOpacity(0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
              onChanged: (String? value) {
                print(value);
                setState(() {
                  search = value.toString();
                });
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: productName.length,
                itemBuilder: (context, index) {
                  late String postion = productName[index].toString();
                  if (searchController.text.isEmpty) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image(
                                  height: 100,
                                  width: 100,
                                  image: AssetImage(
                                    productImage[index].toString(),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        productName[index].toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        productUnit[index].toString() + " ",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        r"Rp " + productPrice[index].toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: InkWell(
                                          onTap: () {
                                            print(index);
                                            print(index);
                                            print(
                                              productName[index].toString(),
                                            );
                                            print(
                                              productPrice[index].toString(),
                                            );
                                            print(productPrice[index]);
                                            print('1');
                                            print(
                                              productUnit[index].toString(),
                                            );
                                            print(
                                              productImage[index].toString(),
                                            );

                                            dbHelper!
                                                .insert(
                                              Cart(
                                                id: index,
                                                productId: index.toString(),
                                                productName: productName[index]
                                                    .toString(),
                                                initialPrice:
                                                    productPrice[index],
                                                productPrice:
                                                    productPrice[index],
                                                quantity: 1,
                                                unitTag: productUnit[index]
                                                    .toString(),
                                                image: productImage[index]
                                                    .toString(),
                                              ),
                                            )
                                                .then(
                                              (value) {
                                                cart.addTotalPrice(
                                                  double.parse(
                                                    productPrice[index]
                                                        .toString(),
                                                  ),
                                                );
                                                cart.addCounter();

                                                // ignore: prefer_const_constructors
                                                final snackBar = SnackBar(
                                                  backgroundColor: Colors.brown,
                                                  content: const Text(
                                                      'Product is added to cart'),
                                                  duration: const Duration(
                                                    seconds: 1,
                                                  ),
                                                );

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              },
                                            ).onError(
                                              (error, stackTrace) {
                                                print(
                                                  "error" + error.toString(),
                                                );
                                                // ignore: prefer_const_constructors
                                                final snackBar = SnackBar(
                                                  backgroundColor: Colors.red,
                                                  content: const Text(
                                                      'Product is already added in cart'),
                                                  duration: const Duration(
                                                    seconds: 1,
                                                  ),
                                                );

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              },
                                            );
                                          },
                                          child: Container(
                                            height: 35,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.brown,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Add to cart',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  } else if (postion.toLowerCase().contains(
                        searchController.text.toLowerCase(),
                      )) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image(
                                  height: 100,
                                  width: 100,
                                  image: AssetImage(
                                    productImage[index].toString(),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        postion,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        productUnit[index].toString() + " ",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        r"Rp " + productPrice[index].toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: InkWell(
                                          onTap: () {
                                            print(index);
                                            print(index);
                                            print(
                                              productName[index].toString(),
                                            );
                                            print(
                                              productPrice[index].toString(),
                                            );
                                            print(
                                              productPrice[index],
                                            );
                                            print('1');
                                            print(
                                              productUnit[index].toString(),
                                            );
                                            print(
                                              productImage[index].toString(),
                                            );

                                            dbHelper!
                                                .insert(
                                              Cart(
                                                id: index,
                                                productId: index.toString(),
                                                productName: productName[index]
                                                    .toString(),
                                                initialPrice:
                                                    productPrice[index],
                                                productPrice:
                                                    productPrice[index],
                                                quantity: 1,
                                                unitTag: productUnit[index]
                                                    .toString(),
                                                image: productImage[index]
                                                    .toString(),
                                              ),
                                            )
                                                .then(
                                              (value) {
                                                cart.addTotalPrice(
                                                  double.parse(
                                                    productPrice[index]
                                                        .toString(),
                                                  ),
                                                );
                                                cart.addCounter();

                                                // ignore: prefer_const_constructors
                                                final snackBar = SnackBar(
                                                  backgroundColor: Colors.brown,
                                                  content: const Text(
                                                      'Product is added to cart'),
                                                  duration: const Duration(
                                                      seconds: 1),
                                                );

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              },
                                            ).onError((error, stackTrace) {
                                              print(
                                                "error" + error.toString(),
                                              );
                                              // ignore: prefer_const_constructors
                                              final snackBar = SnackBar(
                                                backgroundColor: Colors.red,
                                                content: const Text(
                                                    'Product is already added in cart'),
                                                duration:
                                                    const Duration(seconds: 1),
                                              );

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            });
                                          },
                                          child: Container(
                                            height: 35,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.brown,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: const Center(
                                              child: Text(
                                                'Add to cart',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
