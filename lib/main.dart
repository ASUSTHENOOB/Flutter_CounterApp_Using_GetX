import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tests/mycontreoller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(
      //       seedColor: const Color.fromARGB(255, 101, 2, 128)),
      //   useMaterial3: true,
      // ),
      home: const MyHomePage(title: 'Counter App GetX'),
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
  final MyController _controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    print(
        "I Am Rebuilding...."); // Note : This is for testing to check cleaness of getx over simple setstate that rebuilts whole Ui continousl and gets more memory....//
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade200,
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Text(
                "Counter Using Getx by Asus The Noob ! ".toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              ),
            ),
            Text(
              'Have been Pushed 😊'.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Obx(
                () => _controller.count >= 0
                    ? Text("${_controller.count}")
                    : Text(
                        "Going in Negative values .. PLease press button for the you tappped to increment"
                            .toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    backgroundColor: Colors.purple.shade200,
                    onPressed: _controller.incrementCounter,
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.purple.shade200,
                    onPressed: _controller.decrementCounter,
                    child: const Icon(Icons.remove),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
