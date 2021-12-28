import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:spark/charts/chart_4.dart';
import 'package:spark/constans/constans.dart';

class Product {
  String name;
  bool enable;
  Product({
    required this.name,
    this.enable = true,
  });
}

class PanelRightPage extends StatefulWidget {
  const PanelRightPage({Key? key}) : super(key: key);

  @override
  State<PanelRightPage> createState() => _PanelRightPageState();
}

class _PanelRightPageState extends State<PanelRightPage> {
  final List<Product> _product = [
    Product(name: "LED Submersible Lights", enable: true),
    Product(name: "Portable Projector", enable: true),
    Product(name: "Bluetooth Speaker", enable: true),
    Product(name: "Smart Watch", enable: true),
    Product(name: "Temporary Tattoos", enable: true),
    Product(name: "Bookends", enable: true),
    Product(name: "Vegetable Chopper", enable: true),
    Product(name: "Neck Massager", enable: true),
    Product(name: "Facial Cleanser", enable: true),
    Product(name: "Back Cushion", enable: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: kPadding / 2, right: kPadding / 2, top: kPadding / 2),
              child: Card(
                  color: purplelight,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const ListTile(
                    title: Text(
                      "Net Revenue",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "7% of Sales Avg.",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Chip(
                      label: Text(
                        r"$46,450",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )),
            ),
            const LineChartSample1(),
            Padding(
              padding: EdgeInsets.only(
                  left: kPadding / 2,
                  right: kPadding / 2,
                  top: kPadding,
                  bottom: kPadding),
              child: Card(
                color: purplelight,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: List.generate(
                    _product.length,
                    (index) => SwitchListTile.adaptive(
                      title: Text(
                        _product[index].name,
                        style: const TextStyle(color: Colors.white),
                      ),
                      value: _product[index].enable,
                      onChanged: (newValue) {
                        setState(() {
                          _product[index].enable = newValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
