import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final WebViewController _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate
    ..loadRequest(Uri.parse('https://flutter.dev'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('나만의 웹브라우저'), actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
        PopupMenuButton<String>(
            onSelected: (value) {
              _controller.loadRequest(Uri.parse(value));
              // print(value);
            },
            itemBuilder: (context) => [
                  const PopupMenuItem<String>(
                      value: 'https://kakao.com', child: Text('카카오')),
                  const PopupMenuItem<String>(
                      value: 'https://naver.com', child: Text('네이버')),
                  const PopupMenuItem<String>(
                      value: 'https://google.com', child: Text('구글'))
                ]),
      ]),
      body: PopScope( // 뒤로 가기 기능
        canPop: true,
        onPopInvoked: (didPop) async {
          if (await _controller.canGoBack ()) { //뒤로 갈 수 있으면 goback
            await _controller.goBack();
          }
        },
        child: WebViewWidget(controller: _controller),
      )
    );
  }
}
