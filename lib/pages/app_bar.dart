import 'package:flutter/material.dart';
import 'package:spark/constans/constans.dart';
import 'package:spark/pages/responsive.dart';

List<String> _buttonNames = ["Overview", "Revenue", "Sales", "Control"];
int _currentSelectedButton = 0;

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: purplelight,
      child: Row(
        children: [
          //لو فاتح من الكمبيوتر هيظهر الدروار ولو عكس كده هيكون ظاهر الايقونه بتاعت الدراور بس ادوس عليها عشان افتح
          if (ResponsiveLayout.isComputer(context))
            Container(
              margin: EdgeInsets.all(kPadding),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0, 0),
                      spreadRadius: 1,
                      blurRadius: 10)
                ],
                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://raw.githubusercontent.com/fluttermapp/flutter-ui-panel-dashboard/main/images/mapp.png'),
                radius: 30,
              ),
            )
          else
            IconButton(
                iconSize: 30,
                color: Colors.white,
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu)),
          SizedBox(
            width: kPadding,
          ),
          const Spacer(),
          //في حاله الكمبيوتر هيعرض التاب بار غير كده هيعرض التاب الحاليه
          if (ResponsiveLayout.isComputer(context))
            ...List.generate(
                _buttonNames.length,
                (index) => TextButton(
                      onPressed: () {
                        setState(() {
                          _currentSelectedButton = index;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(kPadding * 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              _buttonNames[index],
                              style: TextStyle(
                                color: _currentSelectedButton == index
                                    ? Colors.white
                                    : Colors.white70,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(kPadding / 2),
                              height: 2,
                              width: 60,
                              decoration: _currentSelectedButton == index
                                  ? BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        red,
                                        orange,
                                      ]),
                                    )
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    ))
          else
            Padding(
              padding: EdgeInsets.all(kPadding * 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _buttonNames[_currentSelectedButton],
                    style: const TextStyle(color: Colors.white),
                  ),
                  Container(
                      margin: EdgeInsets.all(kPadding / 2),
                      height: 2,
                      width: 60,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          red,
                          orange,
                        ]),
                      )),
                ],
              ),
            ),
          const Spacer(),
          IconButton(
              color: Colors.white,
              iconSize: 30,
              onPressed: () {},
              icon: const Icon(Icons.search)),
          Stack(
            children: [
              IconButton(
                  color: Colors.white,
                  iconSize: 30,
                  onPressed: () {},
                  icon: const Icon(Icons.notifications)),
              const Positioned(
                right: 6,
                top: 6,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.pink,
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              )
            ],
          ),
          //هنا هيعرض الصوره في كل الحالات  ماعدا الفون
          if (!ResponsiveLayout.isPhoneLimit(context))
            Container(
              margin: EdgeInsets.all(kPadding),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0, 0),
                      spreadRadius: 1,
                      blurRadius: 10)
                ],
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: orange,
                backgroundImage: const NetworkImage(
                    'https://raw.githubusercontent.com/fluttermapp/flutter-ui-panel-dashboard/main/images/profile.png'),
                radius: 30,
              ),
            ),
        ],
      ),
    );
  }
}
