import 'package:flutter/material.dart';
import 'package:flutter_app/teads/teads_controller.dart';
import 'package:flutter_app/teads/teads_settings.dart';
import 'package:flutter_app/teads/teads_ad.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teads Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Teads Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

typedef void TeadsCreatedCallback(TeadsViewController controller);

class _MyHomePageState extends State<MyHomePage> {
  double _size = 0;
  TeadsAdSettings adSettings;

  _MyHomePageState() {
    adSettings = TeadsAdSettings(
      debugModeEnabled: true,
      publisherSlotUrl: "http://teads.com"
    );

    adSettings.userConsent("SUBJECT_GDPR", "CONSENTsldfjsdlfj", TCFVersion.V2, 1234567);
  }

  void _resizeAd(double adRatio) {
    Size mediaQuery = MediaQuery.of(context).size;
    double height = mediaQuery.width / adRatio;

    setState(() {
      if (height > mediaQuery.height)
        _size = height;
      else
        _size = mediaQuery.width / adRatio;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              height: _size,
              child: TeadsAd(
                pid: 127547,
                settings: this.adSettings,
                onRatioUpdated: (double adRatio) {
                  _resizeAd(adRatio);
                },
                onTeadsViewCreated: () {},
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
