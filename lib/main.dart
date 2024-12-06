import 'package:animation_app/detail_page.dart';
import 'package:animation_app/drag_anim.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<String> imgList = [
    "https://cdn.pixabay.com/user/2023/02/17/18-01-21-323_250x250.jpeg",
    "https://cdn.pixabay.com/user/2024/11/22/04-36-45-82_250x250.jpg",
    "https://cdn.pixabay.com/user/2024/06/10/13-43-32-848_250x250.jpg",
    "https://cdn.pixabay.com/user/2024/06/10/13-43-32-848_250x250.jpg",
    "https://cdn.pixabay.com/user/2022/04/07/18-24-56-559_250x250.jpg",
    "https://cdn.pixabay.com/user/2022/04/07/18-24-56-559_250x250.jpg",
    "https://cdn.pixabay.com/user/2023/05/21/19-38-51-804_250x250.jpg",
    "https://cdn.pixabay.com/user/2024/03/06/21-40-30-298_250x250.jpg",
    "https://cdn.pixabay.com/user/2023/05/21/19-38-51-804_250x250.jpg",
    "https://cdn.pixabay.com/user/2019/04/11/22-45-05-994_250x250.jpg",
    "https://cdn.pixabay.com/user/2016/10/05/20-08-18-303_250x250.jpg",
    "https://cdn.pixabay.com/user/2023/05/21/19-38-51-804_250x250.jpg",
    "https://cdn.pixabay.com/user/2019/01/29/15-01-52-802_250x250.jpg",
    "https://cdn.pixabay.com/user/2017/11/30/23-14-18-786_250x250.jpg",
    "https://cdn.pixabay.com/user/2024/11/05/10-25-17-681_250x250.jpg",
    "https://cdn.pixabay.com/user/2024/11/13/15-07-01-248_250x250.jpg",
    "https://cdn.pixabay.com/user/2024/06/10/13-43-32-848_250x250.jpg",
    "https://cdn.pixabay.com/user/2022/10/16/14-43-15-25_250x250.jpg",
    "https://cdn.pixabay.com/user/2022/11/08/18-18-28-965_250x250.jpg",
    "https://cdn.pixabay.com/user/2024/11/21/20-51-04-480_250x250.jpg",
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return DragAnim();
                  },
                ));
              },
              icon: Icon(Icons.drag_handle))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            InkWell(
              onTap: _incrementCounter,
              child: Hero(
                tag: "count",
                child: Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: imgList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return DetailPage(
                          counter: _counter,
                          imgUrl: imgList[index],
                          imgIndex: index,
                        );
                      },
                    ));
                  },
                  child: SizedBox(
                    height: 120,
                    child: Hero(
                      tag: "morlo$index",
                      child: Image.network(
                        imgList[index],
                      ),
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "2",
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return DetailPage(
                    counter: _counter,
                  );
                },
              ));
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: "1",
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return DetailPage(
                    counter: _counter,
                  );
                },
              ));
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
