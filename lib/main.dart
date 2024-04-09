import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final List<String> items1 = [
  'Edit Profile',
  'Reports',
  'Terms & Conditions',
  'Language',
  'Security'
];

final List<String> items2 = [
  'About INSIGHTOH',
  'Logout',
];

void main() {
  runApp(const MaterialApp(
    home: Dashboard(),
  ));
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD7F8E5),
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(35, 10, 0, 0),
              child: const Row(
                children: [
                  Text(
                    "Profile",
                    style: TextStyle(
                      color: Color(0xFF14521A),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            RawMaterialButton(
              shape: const CircleBorder(),
              elevation: 20,
              onPressed: () {
                print("hello siddu");
              },
              child: Stack(
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      color: const Color(0xFF14521A),
                      borderRadius: BorderRadius.circular(55.0),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/Edit Profile.svg",
                        height: 60,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 4,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: Color(0xFF32DC6E),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.edit_outlined,
                          color: Color(0xFF14521A),
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: const Text("xxx_User Name_xxx"),
            ),
            ListItems(items: items1, setting: "App Settings",),
            ListItems(items: items2, setting: "",)
          ],
        ),
      ),
    ),
    );
  }
}

class ListItems extends StatelessWidget {
  final List<String> items;
  final String setting;
  ListItems({required this.items, required this.setting});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (setting.isNotEmpty)
              Container(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0, 0),
                child: Text(
                  setting,
                  style: const TextStyle(
                    color: Color(0xFF14521A),
                  ),
                ),
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 1,
                    color: Colors.grey,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: ListItem(title: items[index]),
                  );
                },
                shrinkWrap: true,
              ),
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  ListItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.white,
      elevation: 0.7,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      onPressed: () {
        print("hi siddu");
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: SvgPicture.asset(
                    "assets/$title.svg",
                    height: 26,
                    color: const Color(0xFF14521A),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                  child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 15.5,
                    color: Color(0xFF14521A),
                  ),
                ),
    ),
              ],
            ),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    size: 50,
                    color: Color(0xFF14521A),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
