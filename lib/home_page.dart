import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WebViewController _webViewController = WebViewController();

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carpa Family Office"),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     children: <Widget>[
      //       DrawerHeader(
      //         child: Image.asset(
      //           'assets/images/logo_horizontal_carpa.png',
      //           height: 270.0,
      //           width: 270.0,
      //         ),
      //       ),
      //       ListTile(
      //         title: Text("Mobile"),
      //         onTap: () {
      //           Navigator.pushReplacement(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) =>
      //                     HomePage(url: 'http://carpamobile.smartadvisor.com.br:5030/')),
      //           );
      //         },
      //       ),
      //       ListTile(
      //         title: Text("Desktop"),
      //         onTap: () {
      //           Navigator.pushReplacement(

      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) =>
      //                     HomePage(url: 'https://carpa.smartbrain.com.br/')),
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.mobile),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(
                            url:
                                'http://carpamobile.smartadvisor.com.br:5030/')),
                  );
                },
                tooltip: 'Mobile',
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.desktop),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomePage(url: 'https://carpa.smartbrain.com.br/')),
                  );
                },
                tooltip: 'Desktop',
              ),
            ]),
      ),
      body: WebViewWidget(controller: _webViewController),
    );
  }
}
