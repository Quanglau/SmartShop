import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum OptionMenu { reload, openInBrowser }

class WebViewScreen extends StatefulWidget {
  final String url;
  final String shopName;

  const WebViewScreen(this.url, this.shopName, {super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.url),
      );
    debugPrint('url: ${widget.url}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.shopName),
        actions: [
          PopupMenuButton<OptionMenu>(
            //change backgroundColor
            surfaceTintColor: Colors.white,
            onSelected: (value) async {
              switch (value) {
                case OptionMenu.reload:
                  _controller.reload();
                  break;
                case OptionMenu.openInBrowser:
                  if (await launchUrl(
                    Uri.parse(widget.url),
                    mode: LaunchMode.externalApplication,
                  )) {
                    return;
                  }
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<OptionMenu>>[
                const PopupMenuItem<OptionMenu>(
                  value: OptionMenu.reload,
                  child: Text('Tải lại'),
                ),
                const PopupMenuItem<OptionMenu>(
                  value: OptionMenu.openInBrowser,
                  child: Text('Mở trong trình duyệt'),
                ),
              ];
            },
          ),
        ],
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
