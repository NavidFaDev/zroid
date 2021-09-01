import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zroid/services/data_api.dart';
import 'package:zroid/services/info_api.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Map args = {};
  late DataApi dataApi;
  late InfoApi infoApi;

  @override
  Widget build(BuildContext context) {
    args = args.isNotEmpty
        ? args
        : ModalRoute.of(context)!.settings.arguments as Map;
    dataApi = args['data'] as DataApi;
    infoApi = args['info'] as InfoApi;

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String url = dataApi.projectURL;
          launchURL(url);
        },
        backgroundColor: Colors.blueAccent,
        child: Center(
            child: Icon(FontAwesomeIcons.eye,
                semanticLabel: 'Open')),
      ),
    );
  }

  _homeMobile() {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 500,
                      ),
                      child: Card(
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 2.0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        ),
                        shadowColor: Colors.blueGrey[100],
                        child: ClipRRect(
                          child: Image.network(
                            dataApi.projectImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 2.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    shadowColor: Colors.blueGrey[100],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,20,20,0),
                          child: Text(
                            'Project',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0,
                                letterSpacing: 2.0
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,10,20,20),
                          child: Text(
                            dataApi.projectName,
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.normal,
                                fontSize: 16.0,
                                letterSpacing: 1.0
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 2.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    shadowColor: Colors.blueGrey[100],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,20,20,0),
                          child: Text(
                            'About',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0,
                                letterSpacing: 2.0
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,10,20,20),
                          child: Text(
                            dataApi.projectDescription,
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.normal,
                                fontSize: 16.0,
                                letterSpacing: 1.0
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 2.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    shadowColor: Colors.blueGrey[100],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,20,20,0),
                          child: Text(
                            'Team',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0,
                                letterSpacing: 2.0
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,10,20,20),
                          child: Text(
                            dataApi.team,
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.normal,
                                fontSize: 16.0,
                                letterSpacing: 1.0
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 20, height: 10),
                        InkWell(
                          onTap: () {
                            String url = 'https://t.me/${infoApi.telegram}';
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
                            String url = 'https://wa.me/${infoApi.whatsapp}';
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
                            String url = 'https://instagram.com/${infoApi.linkedin}';
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
                                path: infoApi.phone);
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
              )
            ],
          ),
        ),
      );
  }













  _homeDesktop() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.50,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 500,
                      ),
                      child: Card(
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 2.0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        ),
                        shadowColor: Colors.blueGrey[100],
                        child: ClipRRect(
                          child: Image.network(
                            dataApi.projectImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 2.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    shadowColor: Colors.blueGrey[100],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,20,20,0),
                          child: Text(
                            'Project',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0,
                                letterSpacing: 2.0
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,10,20,20),
                          child: Text(
                            dataApi.projectName,
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.normal,
                                fontSize: 16.0,
                                letterSpacing: 1.0
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 2.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    shadowColor: Colors.blueGrey[100],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,20,20,0),
                          child: Text(
                            'About',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0,
                                letterSpacing: 2.0
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,10,20,20),
                          child: Text(
                            dataApi.projectDescription,
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.normal,
                                fontSize: 16.0,
                                letterSpacing: 1.0
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 2.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    shadowColor: Colors.blueGrey[100],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,20,20,0),
                          child: Text(
                            'Team',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0,
                                letterSpacing: 2.0
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,10,20,20),
                          child: Text(
                            dataApi.team,
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.normal,
                                fontSize: 16.0,
                                letterSpacing: 1.0
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 20, height: 10),
                        InkWell(
                          onTap: () {
                            String url = 'https://t.me/${infoApi.telegram}';
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
                            String url = 'https://wa.me/${infoApi.whatsapp}';
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
                            String url = 'https://instagram.com/${infoApi.linkedin}';
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
                                path: infoApi.phone);
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
              )
            ],
          ),
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
