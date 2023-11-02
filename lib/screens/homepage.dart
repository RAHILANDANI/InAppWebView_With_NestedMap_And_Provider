import 'package:flutter/material.dart';
import 'package:mirrorwall/model/web_model.dart';
import 'package:mirrorwall/provider/connectivity_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false)
        .CheckConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Categories for browsing"),
        centerTitle: true,
      ),
      body: (Provider.of<ConnectivityProvider>(context)
                  .connectivityModel
                  .connectivity ==
              'offline')
          ? const Center(
              child: Text(
                "Oops You Are Offline",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            )
          : Column(
              children: WebModel.weblist
                  .map(
                    (e) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'webpage', arguments: e);
                      },
                      child: Card(
                        elevation: 10,
                        child: Container(
                          height: 60,
                          color: Colors.blueGrey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Text(
                                  "${e['webcatageory']}",
                                  style: const TextStyle(fontSize: 26),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 18.0),
                                child: Icon(Icons.arrow_forward_ios_rounded),
                              )
                            ],
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
