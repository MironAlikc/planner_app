import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  List<String> tabs = [
    'Развитие',
    'Спорт',
    'Здоровье',
    'Другое',
    'Работа',
  ];
  int current = 0;

  double chengePositionedofLine() {
    switch (current) {
      case 0:
        return 0;
      case 1:
        return 78;
      case 2:
        return 192;
      case 3:
        return 263;

      default:
        return 0;
    }
  }

  double chengeContainerWidth() {
    switch (current) {
      case 0:
        return 50;
      case 1:
        return 80;
      case 2:
        return 50;
      case 3:
        return 50;

      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.05,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      width: size.width,
                      height: size.height * 0.04,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: tabs.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  current = index;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: index == 0 ? 10 : 22,
                                  top: 7,
                                ),
                                child: Text(
                                  tabs[index],
                                  style: GoogleFonts.ubuntu(
                                    fontSize: current == index ? 16 : 14,
                                    fontWeight: current == index
                                        ? FontWeight.w400
                                        : FontWeight.w300,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  AnimatedPositioned(
                    bottom: 0,
                    left: chengePositionedofLine(),
                    curve: Curves.fastLinearToSlowEaseIn,
                    duration: const Duration(milliseconds: 500),
                    child: AnimatedContainer(
                      curve: Curves.fastLinearToSlowEaseIn,
                      margin: const EdgeInsets.only(left: 10),
                      duration: const Duration(milliseconds: 500),
                      width: chengeContainerWidth(),
                      height: size.height * 0.008,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.greenAccent,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.4),
              child: Text(
                '${tabs[current]} Tab Content',
                style: GoogleFonts.ubuntu(
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
