import 'dart:async';
import 'dart:io';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

import 'package:xml/xml.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final TextEditingController amountController = TextEditingController();
  final TextEditingController currencyController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: amountController,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: Colors.red),
              decoration: const InputDecoration(
                hintText: "Enter Amount",
                errorStyle: TextStyle(fontSize: 10),
              ),
            ),
            TextField(
              controller: currencyController,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13),
              decoration: const InputDecoration(
                hintText: "Enter currency",
                errorStyle: TextStyle(fontSize: 10),
              ),
            ),
            ElevatedButton(
                child: Container(
                  height: 50,
                  color: Colors.grey,
                  child: Center(
                      child: Text(
                    'PAY',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  )),
                ),
                onPressed: () {
                  final builder = XmlBuilder();
                  builder.processing('xml', 'version="1.0"');
                  builder.element('mobile', nest: () {
                    builder.element('store', nest: () {
                      builder.text('20712');
                    });
                    builder.element('key', nest: () {
                      builder.text('MF27f#hJF9T@d7QB');
                    });

                    builder.element('device', nest: () {
                      builder.element('type', nest: () {
                        builder.text('Android');
                      });
                      builder.element('id', nest: () {
                        builder.text('id');
                      });
                    });

                    // app
                    builder.element('app', nest: () {
                      builder.element('name', nest: () {
                        builder.text('Telr');
                      });
                      builder.element('version', nest: () {
                        builder.text('1.1.6');
                      });
                      builder.element('user', nest: () {
                        builder.text('2');
                      });
                      builder.element('id', nest: () {
                        builder.text('123');
                      });
                    });

                    //tran
                    builder.element('tran', nest: () {
                      builder.element('test', nest: () {
                        builder.text('1');
                      });
                      builder.element('type', nest: () {
                        builder.text('auth');
                      });
                      builder.element('class', nest: () {
                        builder.text('paypage');
                      });
                      builder.element('cartid', nest: () {
                        builder.text(100000000 + Random().nextInt(999999999));
                      });
                      builder.element('description', nest: () {
                        builder.text('Test for Mobile API order');
                      });
                      builder.element('currency', nest: () {
                        builder.text(currencyController.text);
                      });
                      builder.element('amount', nest: () {
                        builder.text(amountController.text);
                      });
                      builder.element('language', nest: () {
                        builder.text('en');
                      });
                      builder.element('firstref', nest: () {
                        builder.text('first');
                      });
                      builder.element('ref', nest: () {
                        builder.text('null');
                      });
                    });

                    //billing
                    builder.element('billing', nest: () {
                      // name
                      builder.element('name', nest: () {
                        builder.element('title', nest: () {
                          builder.text('');
                        });
                        builder.element('first', nest: () {
                          builder.text('Div');
                        });
                        builder.element('last', nest: () {
                          builder.text('V');
                        });
                      });
                      // address
                      builder.element('address', nest: () {
                        builder.element('line1', nest: () {
                          builder.text('Dubai');
                        });
                        builder.element('city', nest: () {
                          builder.text('Dubai');
                        });
                        builder.element('region', nest: () {
                          builder.text('');
                        });
                        builder.element('country', nest: () {
                          builder.text('AE');
                        });
                      });

                      builder.element('phone', nest: () {
                        builder.text('551188269');
                      });
                      builder.element('email', nest: () {
                        builder.text('test@telr.com');
                      });
                    });
                  });

                  final bookshelfXml = builder.buildDocument();

                  print(bookshelfXml);
                  pay(bookshelfXml, context);
                }),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

void alertShow(String text, context) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(
        '$text',
        style: TextStyle(fontSize: 15),
      ),
      actions: <Widget>[
        ElevatedButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ],
    ),
  );
}

void pay(XmlDocument xml, context) async {
  NetworkHelper _networkHelper = NetworkHelper();
  var response = await _networkHelper.pay(xml);
  print(response);
  if (response == 'failed' || response == null) {
    // failed
    alertShow('Failed', context);
  } else {
    final doc = XmlDocument.parse(response);
    final url = doc.findAllElements('start').map((node) => node.text);
    final code = doc.findAllElements('code').map((node) => node.text);
    print(url);
    var _url = url.toString();
    String _code = code.toString();
    if (_url.length > 2) {
      _url = _url.replaceAll('(', '');
      _url = _url.replaceAll(')', '');
      _code = _code.replaceAll('(', '');
      _code = _code.replaceAll(')', '');
      _launchURL(_url, _code, context);
    }
    print(_url);
    final message = doc.findAllElements('message').map((node) => node.text);
    print('Message =  $message');
    if (message.toString().length > 2) {
      String msg = message.toString();
      msg = msg.replaceAll('(', '');
      msg = msg.replaceAll(')', '');
      alertShow(msg, context);
    }
  }
}

class NetworkHelper {
  NetworkHelper();

  Future pay(XmlDocument xml) async {
    String url = 'https://secure.telr.com/gateway/mobile.xml';
    var data = {xml};
    var body = data.toString();
    // print('body = $body');

    var response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/xml",
      },
    );
    print("Response = ${response.statusCode}");
    // print("Response body = ${response.body}");
    if (response.statusCode == 200 || response.statusCode == 400) {
      return response.body;
    } else {
      return 'failed';
    }
  }

  Future completed(XmlDocument xml) async {
    String url = 'https://secure.telr.com/gateway/mobile_complete.xml';
    var data = {xml};

    var body = xml.toString();
    // print('body = $body');

    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/xml",
      },
    );
    print("Response = ${response.statusCode}");
    // print("Response body = ${response.body}");
    if (response.statusCode == 200 || response.statusCode == 400) {
      return response.body;
    } else {
      return 'failed';
    }
  }
}

void _launchURL(String url, String code, context) async {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => WebViewScreen(
                url: url,
                code: code,
              )));
}

class WebViewScreen extends StatefulWidget {
  final url;
  final code;
  WebViewScreen({@required this.url, @required this.code});

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

String _url = '';

class _WebViewScreenState extends State<WebViewScreen> {
  String _code = '';
  bool _showLoader = false;
  bool _showedOnce = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _url = widget.url;
    _code = widget.code;
    print('url in webview $_url, $_code');
  }

  void complete(XmlDocument xml) async {
    setState(() {
      _showLoader = true;
    });
    NetworkHelper _networkHelper = NetworkHelper();
    var response = await _networkHelper.completed(xml);
    print(response);
    if (response == 'failed' || response == null) {
      alertShow('Failed. Please try again', false);
      setState(() {
        _showLoader = false;
      });
    } else {
      final doc = XmlDocument.parse(response);
      final message = doc.findAllElements('message').map((node) => node.text);
      if (message.toString().length > 2) {
        String msg = message.toString();
        msg = msg.replaceAll('(', '');
        msg = msg.replaceAll(')', '');
        setState(() {
          _showLoader = false;
        });
        if (!_showedOnce) {
          _showedOnce = true;
          alertShow('Your transaction is $msg', true);
        }
        // https://secure.telr.com/gateway/webview_start.html?code=a8caa483fe7260ace06a255cc32e
      }
    }
  }

  void alertShow(String text, bool pop) {
    print('popup thrown');
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          '$text',
          style: TextStyle(fontSize: 15),
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {
              print(pop.toString());
              if (pop) {
                print('inside pop');
                Navigator.pop(context);
                Navigator.pop(context);
              } else {
                print('inside false');
                Navigator.pop(context);
              }
            },
            child: Text('ok'),
          ),
        ],
      ),
    );
  }

  void createXml() {
    final builder = XmlBuilder();
    builder.processing('xml', 'version="1.0"');
    builder.element('mobile', nest: () {
      builder.element('store', nest: () {
        builder.text('20712');
      });
      builder.element('key', nest: () {
        builder.text('MF27f#hJF9T@d7QB');
      });
      builder.element('complete', nest: () {
        builder.text(_code);
      });
    });

    final bookshelfXml = builder.buildDocument();
    print(bookshelfXml);
    complete(bookshelfXml);
  }

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Payment',
            style: TextStyle(color: Colors.black),
          ),
          leading: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ),
        body: WebViewWidget(
          controller: WebViewController(),

          //  onWebViewCreated: (WebViewController webViewController) {
          //    _controller.complete(webViewController);
          //  },
          //  navigationDelegate: (NavigationRequest request) {
          //    print('allowing navigation to $request');
          //    return NavigationDecision.navigate;
          //  },
          //  onPageStarted: (String url) {
          //    print('Page started loading: $url');
          //    _showedOnce = false;
          //    if (url.contains('close')) {
          //      print('call the api');
          //    }
          //    if (url.contains('abort')) {
          //      print('show fail and pop');
          //    }
          //  },
          //  onPageFinished: (String url) {
          //    print('Page finished loading: $url');
          //    if (url.contains('close')) {
          //      print('call the api');
          //      createXml();
          //    }
          //    if (url.contains('abort')) {
          //      print('show fail and pop');
          //    }
          //  },
          //  gestureNavigationEnabled: true,
        ));
  }
}
