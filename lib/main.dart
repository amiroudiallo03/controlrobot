import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_stream/urls.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'KAKIRI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const htmlData =
    "<iframe src='http://192.168.252.61:8081' height='300' width='400' title='Example'></iframe>";

class _MyHomePageState extends State<MyHomePage> {
  late VideoPlayerController _controller;

  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
        backgroundColor: Colors.orange,
        leading: Icon(Icons.arrow_back_ios_new),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [Html(data: htmlData)],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20)),
                      child: IconButton(
                          onPressed: () {
                            leftRobot();
                          },
                          icon: Icon(Icons.arrow_back)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          height: 80,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(20)),
                          child: IconButton(
                              onPressed: () {
                                fowardRobot();
                              },
                              icon: Icon(Icons.arrow_upward)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: 80,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: IconButton(
                              icon: Icon(Icons.stop),
                              onPressed: () {
                                stopRobot();
                              },
                            ))),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          height: 80,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(20)),
                          child: IconButton(
                              onPressed: () {
                                backwardRobot();
                              },
                              icon: Icon(Icons.arrow_downward)),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20)),
                      child: IconButton(
                          onPressed: () {
                            rightRobot();
                          },
                          icon: Icon(Icons.arrow_forward)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        child: Icon(Icons.volume_up),
      ),
    );
  }
}
