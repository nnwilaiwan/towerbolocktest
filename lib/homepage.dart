import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:towerblocktest/fluttertoast.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int indexitem;
  String boxname = '';
  String rhombus = 'assets/images/rhombus.png';
  String blue = 'assets/images/rounded-rectangle-blue.png';
  String pink = 'assets/images/rounded-rectangle-pink.png';
  List boximage = [
    'assets/images/rhombus.png',
    'assets/images/rounded-rectangle-blue.png',
    'assets/images/rounded-rectangle-pink.png',
    'assets/images/rounded-rectangle-blue.png',
    'assets/images/rounded-rectangle-pink.png',
    'assets/images/rounded-rectangle-blue.png',
    'assets/images/rounded-rectangle-pink.png',
    'assets/images/rounded-rectangle-blue.png',
    'assets/images/rounded-rectangle-pink.png',
    'assets/images/rounded-rectangle-blue.png',
  ];
  int index = 0;

  void shuffle() {
    boximage.replaceRange(2, 3, ['assets/images/rounded-rectangle-blue.png']);
    // boximage.shuffle();
    print('$boximage');
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        setState(() {
          if (boxname == blue) {
            boximage.removeAt(indexitem);
            // print('blue');

          } else if (boximage.length == 1) {
            boximage.removeAt(0);
          } else {
            Fluttertoast.showToast(
                msg: "กดปุ่มให้ตรงสี",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 3,
                backgroundColor: Colors.grey.shade700,
                textColor: Colors.white,
                fontSize: 16.0);
            print(boximage[indexitem] + ' ' + indexitem.toString());
          }
        });
      } else if (index == 1) {
        setState(() {
          if (boxname == pink) {
            boximage.removeAt(indexitem);
          } else if (boximage.length == 1) {
            boximage.removeAt(0);
          } else {
            Fluttertoast.showToast(
                msg: "กดปุ่มให้ตรงสี",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 3,
                backgroundColor: Colors.grey.shade700,
                textColor: Colors.white,
                fontSize: 16.0);
            print(boximage[indexitem] + ' ' + indexitem.toString());
          }
        });
      }
      print(_selectedIndex);
    });
  }

  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Tower Block Test'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: ListView.builder(
                  itemCount: boximage.length,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    indexitem = index;
                    boxname = boximage[indexitem];

                    return Column(
                      children: [
                        Container(
                          width: 200,
                          height: 240,
                          child: Column(
                            children: [
                              Image.asset(
                                boximage[indexitem],
                                scale: 2,
                                fit: BoxFit.fill,
                              ),
                              // Text(indexitem.toString() + " " + boxname),
                            ],
                          ),
                        ),
                        const Divider()
                      ],
                    );
                  }),
            ),
           
            const SizedBox(height: 20)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.circle,
              color: Colors.blue,
            ),
            label: 'blue',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.circle,
              color: Colors.pink,
            ),
            label: 'pink',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget listViewBox() {
    return Container(
      child: ListView.builder(
          itemCount: boximage.length,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                // const SizedBox(height: 20),
                Container(
                  width: 200,
                  height: 240,
                  child: Column(
                    children: [
                      Image.asset(
                        boximage[index],
                        scale: 2,
                        fit: BoxFit.fill,
                      ),
                      Text(index.toString()),
                    ],
                  ),
                ),
                const Divider()
              ],
            );
          }),
    );
  }
}
