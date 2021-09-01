import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:zroid/services/data_api.dart';
import 'package:zroid/services/info_api.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);


  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  late List<DataApi> endList;
  late List<InfoApi> infoList;

  void setupApi() async {
    await getList();
    await getInfo();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'listOfData': endList,
      'infoList': infoList
    });
  }

   Future<List<DataApi>> getList() async {
     Response response = await get(Uri.parse('https://zroid.ir/app/wp-json/custom-routes/v1/data'));
     List<dynamic> parsedListJsonA = jsonDecode(response.body);
     List<dynamic> parsedListJsonB = jsonDecode(parsedListJsonA[0]['title']);


     List<DataApi> itemsList = List<DataApi>.from(parsedListJsonB.map((i) => DataApi.fromJson(i)));

     endList = itemsList;

     return itemsList;
  }

  Future<List<InfoApi>> getInfo() async {
    Response response = await get(Uri.parse('https://zroid.ir/app/wp-json/custom-routes/v1/info'));
    List<dynamic> parsedListJsonA = jsonDecode(response.body);
    List<dynamic> parsedListJsonB = jsonDecode(parsedListJsonA[0]['title']);

    List<InfoApi> itemsList = List<InfoApi>.from(parsedListJsonB.map((i) => InfoApi.fromJson(i)));

    infoList = itemsList;

    return itemsList;
  }

  @override
  void initState() {
    super.initState();
    setupApi();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Center(
          child: SpinKitFadingCube(
              color: Colors.blueAccent,
              size: 50.0
          ),
        )
    );
  }
}
