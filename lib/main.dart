import 'dart:html';

import 'package:flutter/material.dart';
import 'package:training_project/app_images.dart';
import 'package:training_project/second.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      home: fristpage(),
    );
  }
}

class fristpage extends StatelessWidget {
  const fristpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Stack(clipBehavior: Clip.none, children: [
                Positioned(
                  top: 366,
                  left: 40,
                  right: 45,
                  child: Text(
                    'Task Management & To-Do List',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Image.asset(
                  AppImages.female,
                  fit: BoxFit.cover,
                  height: 450,
                  width: 500,
                ),
                SizedBox(
                  height: 20,
                ),
              ]),
            ),
            Text(
              'This productive tool is designed to help                       you better manage your task                                      project-wise conveniently',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff6E6A7C),
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff007AFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    fixedSize: Size(331, 52.0001106262207)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondPage()));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      AppImages.ArrowLeft,
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Let’s Start',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.0,
                      ),
                    )
                  ],
                ))
          ],
        ))));
  }
}
