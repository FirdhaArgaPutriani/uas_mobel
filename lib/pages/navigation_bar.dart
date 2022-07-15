import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'cart_page.dart';
import 'info_page.dart';
import 'payment_page.dart';
import 'productlist_page.dart';
import 'profile_page.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  var PageAll = [
    ProfilePage(),
    PaymentPage(),
    ProductListPage(),
    CartPage(),
    InfoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        items: <Widget>[
          Icon((_page == 0) ? Icons.person_outline : Icons.person),
          Icon((_page == 1) ? Icons.payment_outlined : Icons.payment),
          Icon((_page == 2) ? Icons.home_outlined : Icons.home),
          Icon((_page == 3) ? Icons.shopping_bag_outlined : Icons.shopping_bag),
          Icon((_page == 4) ? Icons.info_outline : Icons.info),
        ],
        color: Colors.brown,
        buttonBackgroundColor: Colors.brown[50],
        backgroundColor: Colors.brown.shade50,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: PageAll[_page],
    );
  }
}
