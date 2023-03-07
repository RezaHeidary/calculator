import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var result = Decimal.zero;
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Calculator",
      )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: num1,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(helperText: "Num 1"),
                style: TextStyle(fontSize: num1.text.length > 43 ? 10 : 14),
                onChanged: (value) {
                  setState(() {});
                },
                maxLines: 2,
              ),
              TextField(
                controller: num2,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(helperText: "Num 2"),
                style: TextStyle(fontSize: num2.text.length > 43 ? 10 : 14),
                onChanged: (value) {
                  setState(() {});
                },
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      try {
                        setState(() {
                          result = Decimal.parse(num1.text) +
                              Decimal.parse(num2.text);
                        });
                      } catch (e) {
                        if (kDebugMode) {
                          print("null");
                        }
                      }
                    },
                    child: const Text(
                      "+",
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        try {
                          result = Decimal.parse(num1.text) *
                              Decimal.parse(num2.text);
                        } catch (e) {
                          if (kDebugMode) {
                            print("null");
                          }
                        }
                      });
                    },
                    child: const Text(
                      "*",
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        try {
                          double division = (double.parse(num1.text) /
                              double.parse(num2.text));

                          result = Decimal.parse(division.toString());
                        } catch (e) {
                          if (kDebugMode) {
                            print("null");
                          }
                        }
                      });
                    },
                    child: const Text(
                      "/",
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        try {
                          result = Decimal.parse(num1.text) -
                              Decimal.parse(num2.text);
                        } catch (e) {
                          if (kDebugMode) {
                            print("null");
                          }
                        }
                      });
                    },
                    child: const Text(
                      "-",
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                ],
              ),
              Text(result.toString())
            ],
          ),
        ),
      ),
    );
  }
}
