import 'package:flutter/material.dart';
import 'package:spark/constans/constans.dart';
import 'package:spark/pages/responsive.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class ButtonsInfo {
  String title;
  IconData icon;
  ButtonsInfo({
    required this.title,
    required this.icon,
  });
}

int currentIndex = 0;
List<ButtonsInfo> buttonNames = [
  ButtonsInfo(title: "Home", icon: Icons.home),
  ButtonsInfo(title: "Setting", icon: Icons.settings),
  ButtonsInfo(title: "Notifications", icon: Icons.notifications),
  ButtonsInfo(title: "Contacts", icon: Icons.contact_phone_rounded),
  ButtonsInfo(title: "Sales", icon: Icons.sell),
  ButtonsInfo(title: "Marketing", icon: Icons.mark_email_read),
  ButtonsInfo(title: "Security", icon: Icons.verified_user),
  ButtonsInfo(title: "Users", icon: Icons.supervised_user_circle_rounded),
];

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(kPadding),
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    'Admin Menu',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  trailing: ResponsiveLayout.isComputer(context)
                      ? null
                      : IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                          )),
                ),
                ...List.generate(
                    buttonNames.length,
                    (index) => Column(
                          children: [
                            Container(
                              decoration: index == currentIndex
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(colors: [
                                        red.withOpacity(0.9),
                                        orange.withOpacity(0.9),
                                      ]))
                                  : null,
                              child: ListTile(
                                title: Text(
                                  buttonNames[index].title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                leading: Padding(
                                  padding: EdgeInsets.all(kPadding),
                                  child: Icon(
                                    buttonNames[index].icon,
                                    color: Colors.white,
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            const Divider(
                              color: Colors.white,
                              thickness: 0.1,
                            ),
                          ],
                        ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
