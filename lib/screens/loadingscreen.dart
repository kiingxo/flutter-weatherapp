import 'package:flutter/material.dart';
import 'package:weatherapp/screens/home.dart';

import 'package:weatherapp/services/apicall.dart';
import 'package:weatherapp/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//my api key from openweathermap.com
const apikey = "00487c361e6542bb23d52913eb9bf31c";

//the main logics of the app are written here

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? lat;
  double? long;
//location and weather data should be gotten whe the widget is called
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationandweather();
  }

  getLocationandweather() async {
    Location location = Location();
    await location.getuserLocation();
    lat = location.lat;
    long = location.long;
    print(location.lat);

    print(location.long);

    HttpClient httpClient = HttpClient(
        url:
            "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apikey&units=metric");

    var weatherdata = await httpClient.getweatherdata();
//the location and weather data gotten are passed foward to the home screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Home(
            locationweather: weatherdata,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        //package that allows loading animation
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 150,
        ),
      ),
    );
  }
}
