import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Information'),
        centerTitle: true,
        actions: const [
          //pay
          Center(
            child: Icon(
              Icons.info_outline,
            ),
          ),
          SizedBox(width: 20.0),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'GO GERABAH',
                textAlign: TextAlign.center,
                style: GoogleFonts.bebasNeue(
                  fontSize: 50,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'GO GERABAH marupakan inovasi dan salah satu pelopor toko online gerabah lainnya.'
                ' GO GERABAH membantu usaha mikro pengrajin gerabah yang susah mempromosikan dagangannya.'
                ' Diharapkan platform ini dapat membantu pengrajin dalam memasarkan dagangannya serta meningkatkan jumlah penjualan.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
