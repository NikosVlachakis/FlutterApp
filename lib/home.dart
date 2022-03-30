import 'package:flutter/material.dart';
import 'dart:math';

List data = [
  {
    "id": 1,
    "open": true,
    "location": "Pagrati",
    "ratings": "4.5",
    "myratings": 3,
    "contact": "6972299370",
    "locationDetails": "Pagrati, ieronos 18",
    "openDays": "Mon-Sat: 9am-8pm",
    "listImages": [
      "https://www.hji.co.uk/wp-content/efs/2020/03/barbers.jpg",
      "https://i.pinimg.com/736x/49/bc/cd/49bccdc09a830f2e1831c40b8a661f70.jpg",
      "https://media.istockphoto.com/photos/barber-shop-owner-wearing-protective-face-mask-and-cutting-customers-picture-id1297946321?b=1&k=20&m=1297946321&s=170667a&w=0&h=fyWRxzdghvvsuRnpE0C1gbwby5A1JQukbRFZxLz9XiM="
    ],
    "name": "Anber Barber Shop",
    "image": "https://f-all.gr/data/logos/anber-koureio_logo.jpeg",
    "favorite": 1
  },
  {
    "id": 2,
    "open": false,
    "location": "Kolonaki",
    "ratings": "5.0",
    "myratings": 2,
    "contact": "6972971628",
    "locationDetails": "Kolonaki, katoko 19",
    "openDays": "Mon-Fri: 9am-10pm",
    "listImages": [
      "https://media.istockphoto.com/photos/man-at-hair-salon-picture-id1096942782?k=20&m=1096942782&s=612x612&w=0&h=RxnJnrI_C4__bah2yeHtO6p4C-n1hLHNDI2oMkNGqHQ=",
      "https://www.bu.edu/files/2019/04/resize-19-1292-BARBER2-076.jpg"
    ],
    "name": "Trixokopteion Shop",
    "image":
        "https://afteroffice.gr/wp-content/uploads/2021/09/barber-shops-800x400.jpg",
    "favorite": 0
  },
  {
    "id": 3,
    "open": true,
    "location": "Pagrati",
    "ratings": "4.5",
    "myratings": 1,
    "contact": "6972989123",
    "locationDetails": "Pagrati, karas 19",
    "openDays": "Wed-Sat: 10am-7pm",
    "listImages": [
      "https://i.pinimg.com/736x/ae/67/7a/ae677a18891ad058e1526f2b087028b6.jpg",
      "https://img.grouponcdn.com/bynder/3yVmdamquoQej7rcgUNpo1bBXFeS/3y-2048x1229/v1/sc600x600.jpg",
      "https://d375139ucebi94.cloudfront.net/region2/gb/42076/biz_photo/d65e17e9dcc049beadc5350a9a90b0-vib-barber-biz-photo-d14957f309754439ae3329d32c33b2-booksy.jpeg?size=640x427"
    ],
    "name": "Kerk's Barber Shop",
    "image":
        "https://www.athenshotspots.gr/wp-content/uploads/2020/06/IMG_8246-1024x683.jpg",
    "favorite": 1
  },
  {
    "id": 4,
    "open": true,
    "location": "Mets",
    "ratings": "4.5",
    "myratings": 3,
    "contact": "6992123123",
    "locationDetails": "Mets, hmmutou 29",
    "openDays": "Tue-Sat: 8-7pm",
    "listImages": [
      "https://salontech.gr/wp-content/uploads/2019/11/eksoplismos-600x566.jpg",
      "https://apicms.thestar.com.my/uploads/images/2019/11/06/370235.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuIAuvkw2rQd4j2lRZekyDRG4iljyGVTfWzpBOgn0VtqZfCzUMr6m22JMQYw0L8Tofu2w&usqp=CAU"
    ],
    "name": "Nick's Barber ",
    "image":
        "https://media.istockphoto.com/photos/barber-applies-shaving-foam-picture-id987634696?k=20&m=987634696&s=612x612&w=0&h=s_r87_MnIyolWYEd-rEGaaCTwyA-QctGirKZVRpMBG0=",
    "favorite": 1
  }
];

List emojis = [
  'assets/boydefault.png',
  'assets/boy1.png',
  'assets/boy2.png',
  'assets/boy3.png',
  'assets/boy5.png',
  'assets/boy6.png'
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int indexEmoji = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                elevation: 0,
                title: Container(
                  child: Row(
                    children: <Widget>[
                      // Text('MyBarber',
                      //     style: TextStyle(
                      //         fontWeight: FontWeight.w500,
                      //         color: Colors.black,
                      //         fontSize:
                      //             MediaQuery.of(context).size.width * 0.067)),
                      // SizedBox(
                      //     width: MediaQuery.of(context).size.width * 0.025),
                      const Image(
                        image: AssetImage('assets/appLogoBarber.png'),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(
                          0,
                          MediaQuery.of(context).size.width * 0.001,
                          MediaQuery.of(context).size.width * 0.04,
                          0),
                      child: GestureDetector(
                        onTap: () {
                          if (indexEmoji == emojis.length - 1) {
                            setState(() {
                              indexEmoji = 0;
                            });
                          } else {
                            setState(() {
                              indexEmoji += 1;
                            });
                          }
                        },
                        child: Image(
                          image: AssetImage(emojis[indexEmoji]),
                        ),
                      )),
                ]),
            body: Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.015,
                  MediaQuery.of(context).size.width * 0.015,
                  MediaQuery.of(context).size.width * 0.015,
                  MediaQuery.of(context).size.width * 0.08),
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () async {
                        List? newList = [];
                        newList = (await Navigator.pushNamed(
                            context, '/profileRoute',
                            arguments: {
                              "open": data[index]["open"],
                              "myratings": data[index]["myratings"],
                              "contact": data[index]["contact"],
                              "locationDetails": data[index]["locationDetails"],
                              "openDays": data[index]["openDays"],
                              "listImages": data[index]["listImages"],
                              "name": data[index]["name"],
                              "favorite": data[index]["favorite"],
                            })) as List?;

                        data[index]["myratings"] = newList![0];
                        data[index]["favorite"] = newList[1];
                        var rng = Random();
                        setState(() {
                          indexEmoji = rng.nextInt(5);
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.31,
                        padding: EdgeInsets.fromLTRB(
                            0, MediaQuery.of(context).size.width * 0.015, 0, 0),
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width * 0.06)),
                            color: Colors.white,
                            elevation: 5,
                            child: Column(children: <Widget>[
                              Stack(children: <Widget>[
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.20,
                                  width: MediaQuery.of(context).size.width * 1,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.06),
                                          topRight: Radius.circular(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.06)),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              data[index]["image"]),
                                          fit: BoxFit.cover)),
                                ),
                                Positioned(
                                  right:
                                      MediaQuery.of(context).size.width * 0.04,
                                  top: MediaQuery.of(context).size.height *
                                      0.015,
                                  child: Image(
                                    image: AssetImage(
                                        data[index]["favorite"] == 1
                                            ? 'assets/redheart.png'
                                            : 'assets/heartWhite.png'),
                                  ),
                                )
                              ]),
                              Container(
                                  padding: EdgeInsets.fromLTRB(
                                      MediaQuery.of(context).size.width * 0.02,
                                      MediaQuery.of(context).size.width * 0.02,
                                      0,
                                      0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            data[index]["name"],
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.056,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Container(
                                            padding: EdgeInsets.fromLTRB(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.013,
                                                0,
                                                0,
                                                0),
                                            child: Image(
                                              image: AssetImage(data[index]
                                                          ["open"] ==
                                                      true
                                                  ? 'assets/openBarber.png'
                                                  : 'assets/closeBarber.png'),
                                            ))
                                      ])),
                              Container(
                                padding: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.width * 0.025,
                                    MediaQuery.of(context).size.width * 0.013,
                                    MediaQuery.of(context).size.width * 0.025,
                                    0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(children: <Widget>[
                                        Container(
                                            padding: EdgeInsets.fromLTRB(
                                                0,
                                                0,
                                                0,
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.025),
                                            child: const Image(
                                              image: AssetImage(
                                                  'assets/location.png'),
                                            )),
                                        Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.fromLTRB(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.01,
                                                0,
                                                0,
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02),
                                            child: Text(
                                              data[index]["location"],
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.042,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                      ]),
                                      Row(children: <Widget>[
                                        Container(
                                            alignment: Alignment.center,
                                            // color: Colors.pink,
                                            padding: EdgeInsets.fromLTRB(
                                                0,
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.046,
                                                0,
                                                0),
                                            child: Text(
                                              data[index]["ratings"],
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.038,
                                                  fontWeight: FontWeight.w700),
                                            )),
                                        Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.fromLTRB(
                                                0,
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.048,
                                                0,
                                                0),
                                            child: Image(
                                              image: AssetImage(data[index]
                                                          ["ratings"] ==
                                                      "5.0"
                                                  ? 'assets/5star.png'
                                                  : 'assets/4.5star.png'),
                                            )),
                                      ])
                                    ]),
                              )
                            ])),
                      ));
                },
              ),
            )));
  }
}
