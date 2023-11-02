import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirrorwall/provider/web_provider.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(args['webpage']),
      ),
      body: InAppWebView(
        onLoadStart: (controller, url) {
          Provider.of<WebProvider>(context, listen: false)
              .initcontroller(controller);
        },
        onLoadStop: (controller, url) {
          Provider.of<WebProvider>(context, listen: false).stoprefresh();
        },
        pullToRefreshController:
            Provider.of<WebProvider>(context).pullToRefreshController,
        initialUrlRequest: URLRequest(
          url: Uri.parse(
            args["weburl"],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.blueGrey,
              onPressed: () {
                Provider.of<WebProvider>(context, listen: false).backward();
              },
              child: const Icon(Icons.arrow_back),
            ),
            const SizedBox(
              width: 5,
            ),
            FloatingActionButton(
              backgroundColor: Colors.blueGrey,
              onPressed: () {
                Provider.of<WebProvider>(context, listen: false).forward();
              },
              child: const Icon(Icons.arrow_forward),
            ),
            const SizedBox(
              width: 5,
            ),
            FloatingActionButton(
              backgroundColor: Colors.blueGrey,
              onPressed: () {
                Provider.of<WebProvider>(context, listen: false).refresh();
              },
              child: const Icon(Icons.refresh),
            ),
            const SizedBox(
              width: 5,
            ),
            FloatingActionButton(
              backgroundColor: Colors.blueGrey,
              onPressed: () {
                Provider.of<WebProvider>(context, listen: false)
                    .home(args['weburl']);
              },
              child: const Icon(Icons.home),
            ),
          ],
        ),
      ),
    );
  }
}
