import 'dart:math';

import 'package:flutter/material.dart';

class Animator3page extends StatefulWidget {
  const Animator3page({super.key});

  @override
  State<Animator3page> createState() => _Animator3pageState();
}

class _Animator3pageState extends State<Animator3page> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> colorAnim;
  late Animation<Color?> colorAnim1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 5))..repeat();
    // colorAnim = ColorTween(begin: Colors.red, end: Colors.blue).animate(_controller);
    colorAnim = TweenSequence<Color?>(
      [
        TweenSequenceItem(
            tween: ColorTween(begin: Colors.black, end: Colors.yellow).chain(
              CurveTween(curve: Curves.linear),
            ),
            weight: 1),
        TweenSequenceItem(
            tween: ColorTween(begin: Colors.yellow, end: Colors.green).chain(
              CurveTween(curve: Curves.linear),
            ),
            weight: 1),
        TweenSequenceItem(
            tween: ColorTween(begin: Colors.green, end: Colors.orange).chain(
              CurveTween(curve: Curves.linear),
            ),
            weight: 1),
        TweenSequenceItem(
            tween: ColorTween(begin: Colors.orange, end: Colors.pink).chain(
              CurveTween(curve: Curves.linear),
            ),
            weight: 1),
      ],
    ).animate(_controller);
    colorAnim1 = TweenSequence<Color?>(
      [
        TweenSequenceItem(
            tween: ColorTween(begin: Colors.pink, end: Colors.yellow).chain(
              CurveTween(curve: Curves.linear),
            ),
            weight: 1),
        TweenSequenceItem(
            tween: ColorTween(begin: Colors.yellow, end: Colors.teal).chain(
              CurveTween(curve: Curves.linear),
            ),
            weight: 1),
        TweenSequenceItem(
            tween: ColorTween(begin: Colors.teal, end: Colors.cyan).chain(
              CurveTween(curve: Curves.linear),
            ),
            weight: 1),
        TweenSequenceItem(
            tween: ColorTween(begin: Colors.cyan, end: Colors.blueAccent).chain(
              CurveTween(curve: Curves.linear),
            ),
            weight: 1),
      ],
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  // gradient: LinearGradient(colors: [colorAnim.value ?? Colors.white, colorAnim1.value ?? Colors.white]),
                  // gradient: RadialGradient(colors: [colorAnim.value ?? Colors.white, colorAnim1.value ?? Colors.white]),
                  gradient: SweepGradient(
                    colors: [colorAnim.value ?? Colors.white, colorAnim1.value ?? Colors.white],
                  ),
                ),
                child: Center(
                  child: Text(
                    "Flutter",
                    style: TextStyle(fontSize: 33, color: colorAnim.value),
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.forward();
        },
      ),
    );
  }
}
