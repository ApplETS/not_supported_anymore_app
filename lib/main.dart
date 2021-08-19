import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:io' show Platform;
import 'package:launch_review/launch_review.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xffef3e45)),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 100.0, top: 25),
            child: Container(
                width: 130.0,
                height: 130.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(45.0))),
                child: new Center(
                    child: Image.asset(
                  'assets/logos/ets.png',
                  excludeFromSemantics: true,
                  width: 130,
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
            child: Text(
              AppLocalizations.of(context)!.not_supported_title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Text(
            AppLocalizations.of(context)!.not_supported_subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0, color: const Color(0xfff5f5f5)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: _buildAvailableOnCard(),
          ),
        ],
      ),
    ));
  }

  Widget _buildAvailableOnCard() {
    if (Platform.isAndroid) {
      return InkWell(
        onTap: () => launchStore(),
        child: _buildAvailableOnCardByDevice(
            'Google Play', 'assets/logos/googleplay.png'),
      );
    } else if (Platform.isIOS) {
      return InkWell(
        onTap: () => launchStore(),
        child: _buildAvailableOnCardByDevice(
            'App Store', 'assets/logos/apple.png'),
      );
    }

    return Container();
  }

  Container _buildAvailableOnCardByDevice(var store, var image) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      height: 100.0,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(30.0))),
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: Image.asset(
                image,
                excludeFromSemantics: true,
                width: 50,
                height: 50,
              )),
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.available_on,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                Text(
                  store,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 21.0, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void launchStore() async {}
}
