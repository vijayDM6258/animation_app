import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DragAnim extends StatefulWidget {
  const DragAnim({super.key});

  @override
  State<DragAnim> createState() => _DragAnimState();
}

class _DragAnimState extends State<DragAnim> {
  bool isRed = false;
  bool isBlue = false;
  bool isBlack = false;
  String isDragging = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            myDraggable("red", Colors.red, isRed),
            SizedBox(
              height: 20,
            ),
            LongPressDraggable<String>(
              data: "blue",
              feedback: Container(
                height: 80,
                width: 80,
                color: Colors.grey,
              ),
              child: isBlue
                  ? Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(border: Border.all(color: Colors.blue), borderRadius: BorderRadius.circular(10)),
                    )
                  : Container(
                      height: 80,
                      width: 80,
                      color: Colors.blue,
                    ),
              childWhenDragging: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(border: Border.all(color: Colors.red), borderRadius: BorderRadius.circular(10)),
              ),
              onDragStarted: () {
                isDragging = "blue";
                setState(() {});
              },
              onDragEnd: (details) {
                isDragging = "";
                setState(() {});
              },
            ),
            SizedBox(height: 50),
            myDraggable("black", Colors.black, isBlack),
            myDraggable("black_new", Colors.black45, isBlack),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DragTarget(
                  builder: (
                    BuildContext context,
                    List<Object?> candidateData,
                    List<dynamic> rejectedData,
                  ) {
                    return Container(
                      height: (isDragging == "red") ? 100 : 80,
                      width: (isDragging == "red") ? 100 : 80,
                      decoration: BoxDecoration(
                        color: isRed ? Colors.red : Colors.transparent,
                        border: Border.all(color: Colors.red, width: (isDragging == "red") ? 8 : 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  },
                  onAcceptWithDetails: (details) {
                    isRed = true;
                    setState(() {});
                    print("onAcceptWithDetails ${details.data} ");
                  },
                  onWillAcceptWithDetails: (details) {
                    return details.data == "red";
                  },
                ),
                DragTarget(
                  builder: (
                    BuildContext context,
                    List<Object?> candidateData,
                    List<dynamic> rejectedData,
                  ) {
                    return Container(
                      height: (isDragging == "blue") ? 100 : 80,
                      width: (isDragging == "blue") ? 100 : 80,
                      decoration: BoxDecoration(
                        color: isBlue ? Colors.blue : Colors.transparent,
                        border: Border.all(color: Colors.blue, width: (isDragging == "blue") ? 8 : 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  },
                  onAcceptWithDetails: (details) {
                    isBlue = true;
                    setState(() {});
                    print("onAcceptWithDetails ${details.data} ");
                  },
                  onWillAcceptWithDetails: (details) {
                    return details.data == "blue";
                  },
                ),
                DragTarget(
                  builder: (
                    BuildContext context,
                    List<Object?> candidateData,
                    List<dynamic> rejectedData,
                  ) {
                    return Container(
                      height: (isDragging == "black") ? 100 : 80,
                      width: (isDragging == "black") ? 100 : 80,
                      decoration: BoxDecoration(
                        color: isBlack ? Colors.black : Colors.transparent,
                        border: Border.all(color: Colors.black, width: (isDragging == "black") ? 8 : 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  },
                  onAcceptWithDetails: (details) {
                    isBlack = true;
                    setState(() {});
                    print("onAcceptWithDetails ${details.data} ");
                  },
                  onWillAcceptWithDetails: (details) {
                    return details.data == "black" || details.data == "black_new";
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                isRed = false;
                isBlack = false;
                isBlue = false;
                setState(() {});
              },
              child: Text("Reset"),
            )
          ],
        ),
      ),
    );
  }

  Widget getRedBox() {
    return Container(
      height: 80,
      width: 80,
      color: Colors.red,
    );
  }

  Widget myDraggable(String data, Color color, bool isdrag) {
    return Draggable<String>(
      data: data,
      feedback: Container(
        height: 80,
        width: 80,
        color: isdrag ? Colors.transparent : Colors.grey,
      ),
      onDragStarted: () {
        isDragging = data;
        setState(() {});
        print("onDragStarted ${data}");
      },
      onDragEnd: (details) {
        isDragging = "";
        setState(() {});
      },
      child: isdrag
          ? Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(border: Border.all(color: color), borderRadius: BorderRadius.circular(10)),
            )
          : Container(
              height: 80,
              width: 80,
              color: color,
            ),
      childWhenDragging: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(border: Border.all(color: color), borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
