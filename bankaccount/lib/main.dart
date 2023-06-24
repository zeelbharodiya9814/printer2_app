// ignore_for_file: sized_box_for_whitespace

import 'package:bankaccount/data.dart';
import 'package:bankaccount/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List<Map<String, dynamic>> AllData = [];

void main() {
  return runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bank Accounts"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(SizeConfig.screenWidth/100),
          ),
          ...Invoice.map(
            (e) => Container(
              height: SizeConfig.screenHeight / 10,
              child: Card(
                color: const Color(0xffB3E6FF),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: SizeConfig.screenWidth / 20,
                    ),
                    Image(
                      image: AssetImage(
                        e["photo"],
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth / 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e["name"],
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.screenHeight / 30),
                        ),
                        Text(
                          e["price"],
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.screenHeight / 40),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Click()),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text("Add Bank Account"),
      ),
    );
  }
}
