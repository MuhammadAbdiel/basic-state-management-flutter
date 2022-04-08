import 'package:flutter/material.dart';
import 'package:flutter_state_management/application_state.dart';
import 'package:flutter_state_management/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Widget option(int index, String plan, String desc, int priceText) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(
            top: 10,
            left: 32,
            right: 32,
            bottom: 10,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: selectedIndex == index
                  ? const Color(0xff007dff)
                  : const Color(0xff4d5b7c),
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: const Color(0xff4d5b7c),
                  ),
                ),
                child: selectedIndex == index
                    ? Image.asset(
                        'assets/images/selected.png',
                        height: 20,
                      )
                    : Image.asset(
                        'assets/images/unselected.png',
                        height: 20,
                      ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plan,
                    style: planText,
                  ),
                  Text(
                    desc,
                    style: description,
                  ),
                ],
              ),
              const Spacer(),
              Text('\$$priceText', style: price),
            ],
          ),
        ),
      );
    }

    Widget header() {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 32,
            right: 32,
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/hero.png',
                height: 200,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Upgrade to ', style: title),
                  Text('Pro', style: proText),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Go unlock all features and\nbuild your own business bigger',
                style: subTitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      );
    }

    Widget checkoutButton() {
      return Column(
        children: [
          Container(
            width: 315,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 84, 167, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(75),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Checkout',
                style: buttonText,
              ),
            ),
          ),
        ],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                header(),
                option(0, 'Monthly', 'Good for starting up', 20),
                option(1, 'Quarterly', 'Focusing on building', 55),
                option(2, 'Yearly', 'Steady Company', 220),
                const SizedBox(height: 32),
                selectedIndex == -1 ? const SizedBox() : checkoutButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
