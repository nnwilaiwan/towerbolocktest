import 'package:flutter/material.dart';
import 'package:towerblocktest/fluttertoast.dart';

class Test extends StatefulWidget {

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.blue,
              onSurface: Colors.red,
            ),
            onPressed: (){
                    Fluttertoast.showToast(
                          msg: "กดปุ่มให้ตรงสี",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 10,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);
            },
            child: const Text('TextButton'),
          ),
        ),
      ),
    );
  }
}
