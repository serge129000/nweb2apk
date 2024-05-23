// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, no_leading_underscores_for_local_identifiers


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:web2apk/app_const/contants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

int loading_status = 0;

class _IndexState extends State<Index> {
  late WebViewController controller;
  //can go back or cam forwrd
  bool goback = false;
  bool goforward = false;
  //bool check internet
  bool checknet = true;
  @override
  void initState() {
    //checher si la connexion existe
    InternetConnectionChecker().onStatusChange.listen((event) {
      if (event == InternetConnectionStatus.disconnected) {
        setState(() {
          checknet = false;
        });
      } else {
        setState(() {
          checknet = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (goback == true) {
          controller.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        //drawer: addDrawer == true ? Drawer() : null,
        floatingActionButton: enable_floating_button == true
            ? FloatingActionButton(
                backgroundColor: Color(int.parse(cnst)),
                onPressed: (() {
                  Alert(
                      context: context,
                      type: AlertType.info,
                      content: Text(
                        infos,
                        style: GoogleFonts.poppins(
                            fontSize: 19, fontWeight: FontWeight.w500),
                      )).show();
                }),
                child: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
              )
            : null,
        appBar: AppBar(
          leading: goback == true
              ? IconButton(
                  onPressed: (() {
                    controller.goBack();
                  }),
                  icon: Icon(Icons.arrow_back_ios))
              : null,
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            goforward == true
                ? IconButton(
                    onPressed: (() {
                      controller.goForward();
                    }),
                    icon: Icon(Icons.arrow_forward_ios))
                : SizedBox(),
            SizedBox(
              width: 5,
            )
          ],
          title: Text(
            name,
            style:
                GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w800),
          ),
          centerTitle: centerTitle,
          elevation: appbar_elevation,
        ),
        body: checknet == true
            ? RefreshIndicator(
                onRefresh: () {
                  return controller.reload();
                },
                child: Stack(alignment: AlignmentDirectional.center, children: [
                  WebViewWidget(
                    controller: WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
    ),
  )
  ..loadRequest(Uri.parse(url))
                  ),
                  loading_status < 100
                      ? (circlGf == true
                          ? CircularProgressIndicator()
                          : Image.asset(
                              "images/loader.gif",
                              width: 50,
                            ))
                      : SizedBox()
                ]),
              )
            : noInternetPage(),
      ),
    );
  }

  Widget noInternetPage() {
    return Center(
      child: Image.asset("images/ncnt.png"),
    );
  }
}
