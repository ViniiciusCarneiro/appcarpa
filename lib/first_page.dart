import 'package:appcarpa/home_page_mobile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FirstPage createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('assets/images/video_carpa.mp4')
          ..initialize().then((context) {
            _videoPlayerController.play();
            _videoPlayerController.setLooping(true);
            _videoPlayerController.setVolume(0.0);
            setState(() {});
          });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                height: _videoPlayerController.value.size.height,
                width: _videoPlayerController.value.size.width,
                child: VideoPlayer(
                  _videoPlayerController,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/logo_horizontal_carpa.png',
                      height: 270.0,
                      width: 270.0,
                    ),
                  ],
                ),
                Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Padding(padding: EdgeInsets.only(top: 20)),
                    // ignore: prefer_const_constructors
                    Text(
                      'Nós Contruimos valor enquanto você constrói sua história.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 100),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextButton(
                      onPressed: () async {
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              // ignore: prefer_const_constructors
                              builder: (context) => initUrl()),
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.only(
                            left: 147, right: 147, top: 5, bottom: 5),
                      ),
                      child: const Text(
                        'Carpa Mobile',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

initUrl() {
  var urlMobile = carpaMobile();
  return urlMobile;
}

carpaMobile() async {
  try {
    var url = "https://carpa-api-manager.azure-api.net/getsmarturls/";

    var headers = {
      'Ocp-Apim-Subscription-Key': '6e92dcd7a60b484998ac836db42f150a',
    };
    var response = await http.get(Uri.parse(url), headers: headers);
    var responseDecode = await jsonDecode(utf8.decode(response.bodyBytes));
    var mobileAppUrls = responseDecode["mobileAppUrls"];
    var smartMobileUrl = mobileAppUrls["smartMobileUrl"];
    return smartMobileUrl;
  } catch (e) {
    print(e);
  }
}
