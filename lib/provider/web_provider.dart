import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebProvider extends ChangeNotifier {
  PullToRefreshController? pullToRefreshController;
  InAppWebViewController? inAppWebViewController;

  void pulltorefresh() {
    pullToRefreshController = PullToRefreshController(
      onRefresh: () {
        inAppWebViewController!.reload();
      },
      options: PullToRefreshOptions(color: Colors.blueGrey),
    );
    notifyListeners();
  }

  void initcontroller(InAppWebViewController controller) {
    inAppWebViewController = controller;
    notifyListeners();
  }

  void stoprefresh() {
    pullToRefreshController!.endRefreshing();
    notifyListeners();
  }

  Future<void> forward() async {
    if (await inAppWebViewController!.canGoForward()) {
      await inAppWebViewController!.goForward();
      notifyListeners();
    }
  }

  Future<void> backward() async {
    if (await inAppWebViewController!.canGoBack()) {
      await inAppWebViewController!.goBack();
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    await inAppWebViewController!.reload();
    notifyListeners();
  }

  Future<void> home(String uri) async {
    inAppWebViewController!.loadUrl(
      urlRequest: URLRequest(
        url: Uri.parse(uri),
      ),
    );
  }
}
