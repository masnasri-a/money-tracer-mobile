import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monaey_tracking/components/snack/add.dart';
import 'package:particles_fly/particles_fly.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final tempDetailHistory = [
    {
      'amount': 'Rp 100.000',
      'date': '2022-01-01',
      'category': 'Eat',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    },
    {
      'amount': 'Rp 100.000',
      'date': '2022-01-01',
      'category': 'Transport',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    },
    {
      'amount': 'Rp 100.000',
      'date': '2022-01-01',
      'category': 'WFC',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main Page',
      routes: {
        '/main': (context) => MainPage(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.centerLeft,
            child:
                Text('Money Tracking', style: TextStyle(color: Colors.black)),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Snack.add(context);
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: const Color.fromARGB(255, 8, 61, 119),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (i) => setState(() => _currentIndex = i),
            items: [
              SalomonBottomBarItem(
                icon: const Icon(Icons.home),
                title: const Text("Home"),
                selectedColor: const Color.fromRGBO(0, 0, 0, 1),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.history_outlined),
                title: const Text("History"),
                selectedColor: Colors.blueAccent.shade400,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.document_scanner_outlined),
                title: const Text("Report"),
                selectedColor: Colors.orange,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.settings_outlined),
                title: const Text("Settings"),
                selectedColor: Colors.teal,
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromRGBO(246, 242, 247, 1),
        body: Column(
          children: [
            Center(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 280,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: const RadialGradient(
                            colors: [Color(0xff3f87d5), Color(0xff083d77)],
                            stops: [0, 1],
                            center: Alignment.topCenter,
                          ),
                          border: Border.all(
                            width: 20,
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: ParticlesFly(
                          height: 250,
                          width: MediaQuery.of(context).size.width - 50,
                          connectDots: true,
                          particleColor: Colors.black54,
                          numberOfParticles: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image(
                                  image: AssetImage(
                                      'assets/images/user-profile.png'),
                                  width: 50,
                                ),
                                Icon(Icons.notifications_outlined,
                                    size: 30, color: Colors.white),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: SizedBox(
                                width: 400,
                                height: 100,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 0.5),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Monthly Usage',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily:
                                                  GoogleFonts.plusJakartaSans()
                                                      .fontFamily,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Rp 100.000.000',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily:
                                                GoogleFonts.plusJakartaSans()
                                                    .fontFamily,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GFProgressBar(
                              percentage: 0.8,
                              lineHeight: 20,
                              alignment: MainAxisAlignment.spaceBetween,
                              leading: const Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Icon(Icons.sentiment_dissatisfied,
                                      color: Colors.white)),
                              trailing: const Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Icon(Icons.sentiment_satisfied,
                                      color: Colors.white)),
                              backgroundColor: Colors.black26,
                              progressBarColor: GFColors.INFO,
                              child: const Text(
                                '80%',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 20,
                height: 120,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Monthly Budget',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily:
                                      GoogleFonts.plusJakartaSans().fontFamily,
                                  color: Colors.black),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                        indent: 20,
                        endIndent: 20,
                      ),
                      Text(
                        'Rp 100.000.000',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            fontFamily:
                                GoogleFonts.plusJakartaSans().fontFamily,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Transaction History',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                      color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tempDetailHistory.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 8, 61, 119),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 10, right: 10),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.fastfood_sharp,
                                            color: Colors.white, size: 15),
                                        const SizedBox(width: 5),
                                        Text(
                                          tempDetailHistory[index]
                                                  ['category'] ??
                                              '',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              fontFamily:
                                                  GoogleFonts.plusJakartaSans()
                                                      .fontFamily,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                  tempDetailHistory[index]['date'] ?? '',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: GoogleFonts.plusJakartaSans()
                                          .fontFamily,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              tempDetailHistory[index]['amount'] ?? '',
                              
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily:
                                      GoogleFonts.plusJakartaSans().fontFamily,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              tempDetailHistory[index]['description'] ?? '',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily:
                                      GoogleFonts.plusJakartaSans().fontFamily,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
