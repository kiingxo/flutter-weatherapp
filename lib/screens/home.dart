import 'package:flutter/material.dart';
import 'package:weatherapp/models/weathermodel.dart';



//the home screen displays the users current weather,temperature and city

class Home extends StatefulWidget {
  //parameter allows me to get data from the loading screen
  var locationweather;
  Home({this.locationweather});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //initializing parameters decoded from the api call
  var weatherModel = WeatherModel();
  int? temperature;
  String? weatherpics;
  String? city;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newui(widget.locationweather);
    print(temperature);
  }

  void newui(dynamic weatherdata) {
    double temperatureindouble = weatherdata["main"]["temp"];
    temperature = temperatureindouble.toInt();
    var condition = weatherdata["weather"][0]["id"];
    weatherpics = weatherModel.getIcon(condition);

    city = weatherdata["name"];
    print(city);
    print(temperature);
  }

  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/weather1.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 15,
            right: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: Text(
                  "$city",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    "$temperature° ",
                    style: const TextStyle(fontSize: 120, color: Colors.white),
                  ),
                  Text(
                    "$weatherpics ",
                    style: const TextStyle(fontSize: 90, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.15,
              ),
              Text(
                "The Weather in $city is $weatherpics with a temperature of $temperature°",
                style: const TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
