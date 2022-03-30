import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int tappedStar = -1;
  int fav = -1;

  void showDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text("Thanks for your feedback!"),
          content: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Colors.blue,
                    size: MediaQuery.of(context).size.width * 0.15,
                  )
                ]),
          ),
          actions: [
            CupertinoDialogAction(
                child: const Text("OK",
                    style: TextStyle(
                      color: Colors.blue,
                    )),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map;

    if (tappedStar == -1 || fav == -1) {
      tappedStar = routeArgs['myratings'];
      fav = routeArgs['favorite'];
    }

    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(routeArgs['name'],
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.06)),
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: MediaQuery.of(context).size.width * 0.05,
              ),
              onPressed: () => Navigator.of(context).pop([tappedStar, fav]),
            ),
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: GestureDetector(
                    onTap: () {
                      //Vibration when click the heart button
                      HapticFeedback.vibrate();
                      setState(() {
                        if (fav == 0) {
                          setState(() {
                            fav = 1;
                          });
                        } else {
                          setState(() {
                            fav = 0;
                          });
                        }
                      });
                    },
                    child: Image(
                      image: AssetImage(fav == 0
                          ? 'assets/actionHearts.png'
                          : 'assets/redheart.png'),
                    ),
                  )),
            ],
          ),
          body: Container(
            padding: EdgeInsets.fromLTRB(
                0, MediaQuery.of(context).size.width * 0.025, 0, 0),
            color: Colors.white,
            child: Column(children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height * 0.38,
                  width: MediaQuery.of(context).size.width * 1,
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.015,
                      0,
                      MediaQuery.of(context).size.width * 0.015,
                      0),
                  color: Colors.white,
                  child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: routeArgs['listImages'].length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.01,
                              0,
                              0,
                              0),
                          height: MediaQuery.of(context).size.height * 0.34,
                          width: MediaQuery.of(context).size.width * 0.92,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.network(
                              routeArgs['listImages'][index],
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * 0.06),
                            ),
                          ),
                        );
                      })),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Tap to Rate:',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.052,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFD4D4D4)),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      tappedStar = index;
                                    });
                                    new Timer(const Duration(milliseconds: 250),
                                        showDialog);
                                  },
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      width: MediaQuery.of(context).size.width *
                                          0.096,
                                      child: tappedStar < index
                                          ? Icon(
                                              Icons.star_border,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.055,
                                            )
                                          : Icon(Icons.star,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.055)));
                            }),
                      ),
                    ]),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.07, 0, 0, 0),
                  child: Row(children: <Widget>[
                    Container(
                      child: const Image(
                        image: AssetImage('assets/Dateimage.png'),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.02,
                            0,
                            MediaQuery.of(context).size.width * 0.1,
                            0),
                        child: Text(routeArgs['openDays'],
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: MediaQuery.of(context).size.width *
                                    0.056))),
                    Container(
                      child: Image(
                        image: AssetImage(routeArgs['open'] == true
                            ? 'assets/openBarber.png'
                            : 'assets/closeBarber.png'),
                      ),
                    )
                  ])),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.085, 0, 0, 0),
                  child: Row(children: <Widget>[
                    Container(
                      child: const Image(
                        image: AssetImage('assets/LocationIcon.png'),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.04, 0, 0, 0),
                        child: Text(routeArgs['locationDetails'],
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: MediaQuery.of(context).size.width *
                                    0.056))),
                  ])),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Container(
                  // color: Colors.red,
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.1, 0, 0, 0),
                  child: Row(children: <Widget>[
                    Container(
                      child: const Image(
                        image: AssetImage('assets/phone.png'),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.04, 0, 0, 0),
                        child: GestureDetector(
                            onTap: () {
                              //Vibration when makes a call
                              HapticFeedback.vibrate();

                              launch('tel:${routeArgs['contact']}');
                            },
                            child: Text(routeArgs['contact'],
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.056)))),
                  ])),
              SizedBox(height: MediaQuery.of(context).size.height * 0.055),
              Container(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.1, 0, 0, 0),
                  child: Row(children: <Widget>[
                    Container(
                        child: GestureDetector(
                            onTap: () {
                              launch('https://facebook.com/');
                            },
                            child: const Image(
                              image: AssetImage('assets/facebookimage.png'),
                            ))),
                    Container(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.01, 0, 0, 0),
                        child: GestureDetector(
                            onTap: () {
                              launch('https://instagram.com/');
                            },
                            child: const Image(
                              image: AssetImage('assets/instagramimage.png'),
                            ))),
                    Container(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.01, 0, 0, 0),
                        child: GestureDetector(
                            onTap: () {
                              launch('https://google.com/');
                            },
                            child: const Image(
                              image: AssetImage('assets/googleimage.png'),
                            )))
                  ]))
            ]),
          ),
        ));
  }
}
