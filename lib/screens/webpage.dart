import 'package:flutter/material.dart';
import 'package:mirrorwall/provider/web_provider.dart';
import 'package:provider/provider.dart';

class WebPage extends StatefulWidget {
  const WebPage({super.key});

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<WebProvider>(context, listen: false).pulltorefresh();
  }

  @override
  Widget build(BuildContext context) {
    var e = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    List weblist = e['category'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Web Pages"),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
        padding: const EdgeInsets.all(10),
        children: weblist
            .map(
              (e) => InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'detailpage', arguments: e);
                },
                child: Container(
                  color: Colors.blueGrey,
                  child: Center(
                    child: Text(
                      "${e["webpage"]}",
                      style: const TextStyle(fontSize: 23),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
