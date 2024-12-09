import 'dart:math';

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Animator1Page extends StatefulWidget {
  const Animator1Page({super.key});

  @override
  State<Animator1Page> createState() => _Animator1PageState();
}

class _Animator1PageState extends State<Animator1Page> {
  bool isBig = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            // InkWell(
            //   onTap: () {
            //     isBig = !isBig;
            //     setState(() {});
            //   },
            //   child: AnimatedContainer(
            //     height: Random().nextInt(400).toDouble() + 50,
            //     width: Random().nextInt(400).toDouble() + 50,
            //     color: getRandomColor(),
            //     duration: Duration(milliseconds: 300),
            //     child: Icon(
            //       Icons.ac_unit,
            //       size: 80,
            //     ),
            //   ),
            // ),
            SizedBox(height: 30),
            // Transform.scale(
            //   scale: 2.8,
            //   child: Switch(
            //     value: false,
            //     onChanged: (bool value) {},
            //   ),
            // ),
            TweenAnimationBuilder(
                tween: ColorTween(begin: Colors.transparent, end: Colors.blue),
                duration: Duration(seconds: 5),
                builder: (context, colorval, _) {
                  return TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 350),
                    duration: Duration(seconds: 5),
                    builder: (context, val, _) {
                      return TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0, end: 12),
                        duration: Duration(seconds: 5),
                        builder: (context, value, child) {
                          return Transform.rotate(
                            angle: pi / 6 * value,
                            child: Icon(
                              Icons.arrow_upward,
                              color: colorval,
                              size: val,
                            ),
                          );
                        },
                      );
                    },
                  );
                })
          ],
        ),
      ),
    );
  }

  Color getRandomColor() {
    var r = Random().nextInt(255);
    var g = Random().nextInt(255);
    var b = Random().nextInt(255);
    return Color.fromRGBO(r, g, b, 1);
  }
}
