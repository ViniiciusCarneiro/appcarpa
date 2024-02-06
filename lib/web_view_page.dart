import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebView Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        url: 'https://carpa.smartbrain.com.br/', // URL padrão para a homepage
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.url}) : super(key: key);

  final String url;

  void _launchMobileUrl(BuildContext context) async {
    final url = 'http://carpamobile.smartadvisor.com.br:5030/';
    await _launchUrl(url, context);
  }

  void _launchDesktopUrl(BuildContext context) async {
    final url = 'https://carpa.smartbrain.com.br/';
    await _launchUrl(url, context);
  }

  Future<void> _launchUrl(String url, BuildContext context) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Não foi possível abrir o link: $url'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carpa Family Office"),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Center(
        child: Text("Conteúdo da página inicial"),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.mobile_friendly),
              onPressed: () {
                _launchMobileUrl(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.desktop_windows),
              onPressed: () {
                _launchDesktopUrl(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
