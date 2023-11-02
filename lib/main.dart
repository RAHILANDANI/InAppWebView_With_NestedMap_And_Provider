import 'package:flutter/material.dart';
import 'package:mirrorwall/provider/connectivity_provider.dart';
import 'package:mirrorwall/provider/web_provider.dart';
import 'package:mirrorwall/screens/homepage.dart';
import 'package:mirrorwall/screens/webdetailpage.dart';
import 'package:mirrorwall/screens/webpage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConnectivityProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WebProvider(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        routes: {
          '/': (context) => MyApp(),
          'webpage': (context) => WebPage(),
          'detailpage': (context) => DetailPage(),
        },
      ),
    ),
  );
}
