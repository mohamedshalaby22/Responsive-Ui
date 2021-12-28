import 'package:flutter/material.dart';
import 'package:spark/charts/chart_1.dart';
import 'package:spark/charts/chart_2.dart';
import 'package:spark/constans/constans.dart';
import 'package:spark/pages/responsive.dart';

class Todo {
  String name;
  bool enable;
  Todo({this.enable = true, required this.name});
}

class PanelLeftPage extends StatefulWidget {
  const PanelLeftPage({Key? key}) : super(key: key);

  @override
  State<PanelLeftPage> createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelLeftPage> {
  final List<Todo> _todos = [
    Todo(name: "Purchase Paper", enable: true),
    Todo(name: "Refill the inventory of speakers", enable: true),
    Todo(name: "Hire someone", enable: true),
    Todo(name: "Maketing Strategy", enable: true),
    Todo(name: "Selling furniture", enable: true),
    Todo(name: "Finish the disclosure", enable: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              color: purplelight,
              child: Container(
                decoration: BoxDecoration(
                  color: purpleDark,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                ),
              ),
            ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                      left: kPadding / 2,
                      right: kPadding / 2,
                      top: kPadding / 2,
                    ),
                    child: Card(
                      color: purplelight,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: const ListTile(
                        title: Text(
                          "Products Sold",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "18% of Products Sold",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Chip(
                          label: Text(
                            "4,500",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )),
                const LineChartSample2(),
                const PieChartSample2(),
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
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: List.generate(
                          _todos.length,
                          (index) => CheckboxListTile(
                              title: Text(
                                _todos[index].name,
                                style: const TextStyle(color: Colors.white),
                              ),
                              value: _todos[index].enable,
                              onChanged: (newValue) {
                                setState(() {
                                  _todos[index].enable = newValue ?? true;
                                });
                              })),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
