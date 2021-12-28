import 'package:flutter/material.dart';
import 'package:spark/charts/chart_3.dart';
import 'package:spark/constans/constans.dart';

class Person {
  String name;
  Color color;
  Person({required this.name, required this.color});
}

class PanelCenterPage extends StatefulWidget {
  const PanelCenterPage({Key? key}) : super(key: key);

  @override
  State<PanelCenterPage> createState() => _PanelCenterPage();
}

class _PanelCenterPage extends State<PanelCenterPage> {
  final List<Person> _persons = [
    Person(name: "Theia Bowen", color: const Color(0xfff8b250)),
    Person(name: "Fariha Odling", color: const Color(0xffff5182)),
    Person(name: "Viola Willis", color: const Color(0xff0293ee)),
    Person(name: "Emmett Forrest", color: const Color(0xfff8b250)),
    Person(name: "Nick Jarvis", color: const Color(0xff13d38e)),
    Person(name: "Amit Clayeia", color: const Color(0xfff8b250)),
    Person(name: "Amalie Howardeia", color: const Color(0xffff5182)),
    Person(name: "Campbell Britton", color: const Color(0xff0293ee)),
    Person(name: "Haley Mellor", color: const Color(0xffff5182)),
    Person(name: "Harlen Higgins", color: const Color(0xff13d38e)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    'Products Available',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    '82% of Products Avail.',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Chip(
                      label: Text(
                    '20,500',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
            const BarChartSample2(),
            Padding(
              padding: EdgeInsets.only(
                left: kPadding / 2,
                right: kPadding / 2,
                top: kPadding,
                bottom: kPadding,
              ),
              child: Card(
                color: purplelight,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: List.generate(
                      _persons.length,
                      (index) => ListTile(
                            leading: CircleAvatar(
                              radius: 15,
                              child: Text(
                                _persons[index].name.substring(0, 1),
                                style: const TextStyle(color: Colors.white),
                              ),
                              backgroundColor: _persons[index].color,
                            ),
                            title: Text(
                              _persons[index].name,
                              style: const TextStyle(color: Colors.white),
                            ),
                            trailing: const Icon(
                              Icons.message,
                              color: Colors.white,
                            ),
                          )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
