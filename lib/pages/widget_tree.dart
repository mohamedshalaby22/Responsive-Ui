import 'package:flutter/material.dart';
import 'package:spark/constans/constans.dart';
import 'package:spark/pages/app_bar.dart';
import 'package:spark/pages/drawer.dart';
import 'package:spark/pages/responsive.dart';
import 'package:spark/panels/panel_center_page.dart';
import 'package:spark/panels/panel_left_page.dart';
import 'package:spark/panels/panel_right_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int currentIndex = 1;
  final List<Widget> _icons = [
    Icon(
      Icons.home,
      size: 30,
      color: purplelight,
    ),
    Icon(Icons.list, size: 30, color: purplelight),
    Icon(Icons.compare_arrows, size: 30, color: purplelight),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerPage(),
      appBar: PreferredSize(
        //لو اليوزر صغر الشاشه اوي هيعرضله كونتيرنر عكس كده الاب بار
        child: (ResponsiveLayout.isTinyLimit(context) ||
                ResponsiveLayout.isTinyHeightLimit(context)
            ? Container()
            : const AppBarWidget()),
        preferredSize: const Size(double.infinity, 100),
      ),
      body: ResponsiveLayout(
        tiny: Container(),
        phone: currentIndex == 0
            ? const PanelLeftPage()
            : currentIndex == 1
                ? const PanelCenterPage()
                : const PanelRightPage(),
        tablet: Row(
          children: const [
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
          ],
        ),
        largetablet: Row(
          children: const [
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
            Expanded(child: PanelRightPage()),
          ],
        ),
        computer: Row(children: const [
          Expanded(child: DrawerPage()),
          Expanded(child: PanelLeftPage()),
          Expanded(child: PanelCenterPage()),
          Expanded(child: PanelRightPage()),
        ]),
      ),
      bottomNavigationBar: ResponsiveLayout.isPhoneLimit(context)
          ? CurvedNavigationBar(
              index: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              height: 70,
              //color: Colors.white.withOpacity(0.15),
              buttonBackgroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 600),
              items: _icons)
          : const SizedBox(),
    );
  }
}
