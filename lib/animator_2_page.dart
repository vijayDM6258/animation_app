import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Animator2Page extends StatefulWidget {
  const Animator2Page({super.key});

  @override
  State<Animator2Page> createState() => _Animator2PageState();
}

class _Animator2PageState extends State<Animator2Page> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller1;
  late Animation<double> sizeAnimate;
  late Animation<Color?> colorAnimate;
  late Animation<double> rotateAnimate;

  late Animation<double> positionAnimate;
  late Animation<double> positionAnimate1;
  late Animation<double> scaleAnimate;
  late Animation<double> scaleAnimate1;

  bool isCom = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2))..repeat();
    sizeAnimate = Tween(begin: 10.0, end: 50.0).animate(_controller);
    colorAnimate = ColorTween(begin: Colors.red, end: Colors.blue).animate(_controller);
    rotateAnimate = Tween(begin: 0.0, end: 4.0).animate(_controller);

    _controller1 = AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    positionAnimate = Tween(begin: 0.0, end: 550.0).animate(CurvedAnimation(
      parent: _controller1,
      curve: Interval(0, 0.2),
    ));
    positionAnimate1 = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
      parent: _controller1,
      curve: Interval(0.2, 0.5),
    ));
    scaleAnimate = Tween(begin: 50.0, end: 150.0).animate(CurvedAnimation(
      parent: _controller1,
      curve: Interval(0.5, 1),
    ));
    scaleAnimate1 = Tween(begin: 50.0, end: 0.0).animate(CurvedAnimation(
      parent: _controller1,
      curve: Interval(0.5, 1),
    ));
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
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  // print("_controller.value ${_controller.value}");
                  return Transform.rotate(
                    angle: (3.14 * rotateAnimate.value) / 2,
                    child: Text(
                      "Flutter",
                      style: TextStyle(fontSize: sizeAnimate.value, color: colorAnimate.value),
                    ),
                  );
                },
              ),
            ),
            AnimatedBuilder(
              animation: _controller1,
              builder: (context, child) {
                return Positioned(
                  bottom: positionAnimate.value,
                  right: positionAnimate1.value,
                  child: InkWell(
                    onTap: () async {
                      if (!isCom) {
                        await _controller1.forward();
                        isCom = true;
                        return;
                      }
                      if (isCom) {
                        await _controller1.reverse();
                        isCom = false;
                      }

                      print("_controller1 ==>${_controller1.isCompleted}");
                    },
                    child: Container(
                      width: scaleAnimate.value,
                      height: scaleAnimate.value,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(scaleAnimate1.value)),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
