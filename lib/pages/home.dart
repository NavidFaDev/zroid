import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zroid/services/data_api.dart';
import 'package:zroid/services/info_api.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}



class _HomeState extends State<Home> {

  Map args = {};
  late List<DataApi> list;
  late List<InfoApi> info;

  @override
  Widget build(BuildContext context) {

    args = args.isNotEmpty ? args : ModalRoute.of(context)!.settings.arguments as Map;
    list = args['listOfData'] as List<DataApi>;
    info = args['infoList'] as List<InfoApi>;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: ScreenTypeLayout(
            mobile: _homeMobile(),
            tablet: _homeMobile(),
            desktop: _homeDesktop(),
          ),
        ),
      ),
    );
  }

  _homeMobile() {
    return SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                  child: Text('Android Developer',
                      style: TextStyle(
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w300,
                          fontSize: 16.0,
                          color: Colors.black54)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Navid\nFarahmandian',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2.5,
                          fontSize: 24.0,
                        )),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0), //or 15.0
                      child: Container(
                          height: 65.0,
                          width: 65.0,
                          child: Image.asset('assets/profile.png')),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 500,
                  ),
                  child: Card(
                    margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                    elevation: 6.0,
                    color: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    shadowColor: Colors.lightBlueAccent,
                    child: InkWell(
                      splashColor: Colors.lightBlueAccent,
                      onTap: () {
                        String url = 'https://t.me/${info[0].telegram}';
                        launchURL(url);
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('I am currently online', style: TextStyle(
                                color: Colors.white70,
                                letterSpacing: 2.5,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0
                            )),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),//or 15.0
                              child: Container(
                                height: 40.0,
                                width: 40.0,
                                color: Colors.white70,
                                child: Center(child: FaIcon(FontAwesomeIcons.telegramPlane, color: Colors.blueAccent, semanticLabel: 'Contact on Telegram')),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child: Text(
                      'Featured',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          letterSpacing: 2.0
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 260.0,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  primary: false,
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) => Card(
                    margin: EdgeInsets.fromLTRB(20, 20, 0, 3),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 2.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    shadowColor: Colors.blueGrey[100],
                    child: InkWell(
                      child: Container(
                        width: 300.0,
                        child: Column(
                          children: [
                            ClipRRect(
                              child: Image.network(
                                list[index].projectImage,
                                height: 150.0,
                                width: 300.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Text(
                                      list[index].projectName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                        color: Colors.blueGrey
                                      ),
                                      maxLines: 2,
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(height: 3.0),
                                    Text(
                                      list[index].projectShortDescription,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.0,
                                        color: Colors.grey[400],
                                      ),
                                      maxLines: 1,
                                      textAlign: TextAlign.left,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/details', arguments: {
                          'data' : list[index],
                          'info' : info[0]
                        });
                      },
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child: Text(
                      'Who Am I?',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          letterSpacing: 1.0
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(20,10,20,0),
                  child: Text(
                    info[0].description,
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0,
                        letterSpacing: 1.0
                    ),
                   )
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 20, height: 10),
                        InkWell(
                          onTap: () {
                            String url = 'https://t.me/${info[0].telegram}';
                            launchURL(url);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),//or 15.0
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              color: Colors.blueAccent,
                              child: Center(child: FaIcon(FontAwesomeIcons.telegramPlane, color: Colors.white70, semanticLabel: 'Contact on Telegram')),
                            ),
                          ),
                        ),
                        SizedBox(width: 20, height: 10),
                        InkWell(
                          onTap: () {
                            String url = 'https://wa.me/${info[0].whatsapp}';
                            launchURL(url);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),//or 15.0
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              color: Colors.greenAccent,
                              child: Center(child: FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white70, semanticLabel: 'Contact on Telegram')),
                            ),
                          ),
                        ),
                        SizedBox(width: 20, height: 10),
                        InkWell(
                          onTap: (){
                            String url = 'https://instagram.com/${info[0].linkedin}';
                            launchURL(url);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),//or 15.0
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              color: Colors.pinkAccent,
                              child: Center(child: FaIcon(FontAwesomeIcons.instagram, color: Colors.white70, semanticLabel: 'Contact on Telegram')),
                            ),
                          ),
                        ),
                        SizedBox(width: 20, height: 10),
                        InkWell(
                          onTap: () {
                            final Uri phoneLaunch = Uri(
                              scheme: 'tel',
                              path: info[0].phone);
                            launch(phoneLaunch.toString());
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),//or 15.0
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              color: Colors.blueAccent,
                              child: Center(child: FaIcon(FontAwesomeIcons.phone, color: Colors.white70, semanticLabel: 'Contact on Telegram')),
                            ),
                          ),
                        ),
                        SizedBox(width: 20, height: 10)
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(width: 20, height: 50.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Made with',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                      letterSpacing: 2.0
                    )),
                    SizedBox(width: 10),
                    Icon(FontAwesomeIcons.solidHeart, size: 20, color: Colors.blueGrey),
                    SizedBox(width: 10),
                    Text('At Zoom Roid - v1.0.0',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0,
                            letterSpacing: 2.0
                        )),
                  ],
                ),
              )
            ],
          ),
        );
  }


  // Desktop Home Page

  _homeDesktop() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.50,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                child: Text('Android Developer',
                    style: TextStyle(
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w300,
                        fontSize: 16.0,
                        color: Colors.black54)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Navid\nFarahmandian',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2.5,
                        fontSize: 24.0,
                      )),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0), //or 15.0
                    child: Container(
                        height: 65.0,
                        width: 65.0,
                        child: Image.asset('assets/profile.png')),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 500,
                ),
                child: Card(
                  margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                  elevation: 6.0,
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  shadowColor: Colors.lightBlueAccent,
                  child: InkWell(
                    splashColor: Colors.lightBlueAccent,
                    onTap: () {
                      String url = 'https://t.me/${info[0].telegram}';
                      launchURL(url);
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('I am currently online', style: TextStyle(
                              color: Colors.white70,
                              letterSpacing: 2.5,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0
                          )),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),//or 15.0
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              color: Colors.white70,
                              child: Center(child: FaIcon(FontAwesomeIcons.telegramPlane, color: Colors.blueAccent, semanticLabel: 'Contact on Telegram')),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                  child: Text(
                    'Featured',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                        letterSpacing: 2.0
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 260.0,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                primary: false,
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) => Card(
                  margin: EdgeInsets.fromLTRB(20, 20, 0, 3),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 2.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  shadowColor: Colors.blueGrey[100],
                  child: InkWell(
                    child: Container(
                      width: 300.0,
                      child: Column(
                        children: [
                          ClipRRect(
                            child: Image.network(
                              list[index].projectImage,
                              height: 150.0,
                              width: 300.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Text(
                                    list[index].projectName,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                        color: Colors.blueGrey
                                    ),
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(height: 3.0),
                                  Text(
                                    list[index].projectShortDescription,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0,
                                      color: Colors.grey[400],
                                    ),
                                    maxLines: 1,
                                    textAlign: TextAlign.left,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/details', arguments: {
                        'data' : list[index],
                        'info' : info[0]
                      });
                    },
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                  child: Text(
                    'Who Am I?',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                        letterSpacing: 1.0
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(20,10,20,0),
                    child: Text(
                      info[0].description,
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                          letterSpacing: 1.0
                      ),
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 20, height: 10),
                      InkWell(
                        onTap: () {
                          String url = 'https://t.me/${info[0].telegram}';
                          launchURL(url);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),//or 15.0
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            color: Colors.blueAccent,
                            child: Center(child: FaIcon(FontAwesomeIcons.telegramPlane, color: Colors.white70, semanticLabel: 'Contact on Telegram')),
                          ),
                        ),
                      ),
                      SizedBox(width: 20, height: 10),
                      InkWell(
                        onTap: () {
                          String url = 'https://wa.me/${info[0].whatsapp}';
                          launchURL(url);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),//or 15.0
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            color: Colors.greenAccent,
                            child: Center(child: FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white70, semanticLabel: 'Contact on Telegram')),
                          ),
                        ),
                      ),
                      SizedBox(width: 20, height: 10),
                      InkWell(
                        onTap: (){
                          String url = 'https://instagram.com/${info[0].linkedin}';
                          launchURL(url);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),//or 15.0
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            color: Colors.pinkAccent,
                            child: Center(child: FaIcon(FontAwesomeIcons.instagram, color: Colors.white70, semanticLabel: 'Contact on Telegram')),
                          ),
                        ),
                      ),
                      SizedBox(width: 20, height: 10),
                      InkWell(
                        onTap: () {
                          final Uri phoneLaunch = Uri(
                              scheme: 'tel',
                              path: info[0].phone);
                          launch(phoneLaunch.toString());
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),//or 15.0
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            color: Colors.blueAccent,
                            child: Center(child: FaIcon(FontAwesomeIcons.phone, color: Colors.white70, semanticLabel: 'Contact on Telegram')),
                          ),
                        ),
                      ),
                      SizedBox(width: 20, height: 10)
                    ],
                  ),
                )
              ],
            ),
            SizedBox(width: 20, height: 50.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Made with',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0,
                          letterSpacing: 2.0
                      )),
                  SizedBox(width: 10),
                  Icon(FontAwesomeIcons.solidHeart, size: 20, color: Colors.blueGrey),
                  SizedBox(width: 10),
                  Text('At Zoom Roid - v1.0.0',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0,
                          letterSpacing: 2.0
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

