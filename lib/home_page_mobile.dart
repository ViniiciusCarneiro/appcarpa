import 'package:appcarpa/home_page_desktop.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({super.key});

  @override
  State<HomePageMobile> createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carpa Family Office"),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Image.asset(
                'assets/images/logo_horizontal_carpa.png',
                height: 270.0,
                width: 270.0,
              ),
            ),
            ListTile(
              title: Text("Mobile"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      // ignore: prefer_const_constructors
                      builder: (context) => HomePageMobile()),
                );
                // Acción al seleccionar opción 1
              },
            ),
            ListTile(
              title: Text("Desktop"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      // ignore: prefer_const_constructors
                      builder: (context) => HomePageDesktop()),
                );
                // Acción al seleccionar opción 2
              },
            ),
          ],
        ),
      ),
      // ignore: prefer_const_constructors
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'http://carpamobile.smartadvisor.com.br:5030/',
      ),
    );
  }
}
