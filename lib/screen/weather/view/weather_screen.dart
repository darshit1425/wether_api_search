import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wether_api_search/screen/weather/model/weather_model.dart';
import 'package:wether_api_search/screen/weather/provider/weather_provider.dart';

class weatherScreen extends StatefulWidget {
  const weatherScreen({Key? key}) : super(key: key);

  @override
  State<weatherScreen> createState() => _weatherScreenState();
}

class _weatherScreenState extends State<weatherScreen> {
  WeatherScreenProvider? weatherScreenProviderTrue;
  WeatherScreenProvider? weatherScreenProviderFalse;

  @override
  Widget build(BuildContext context) {
    weatherScreenProviderFalse =
        Provider.of<WeatherScreenProvider>(context, listen: false);
    weatherScreenProviderTrue =
        Provider.of<WeatherScreenProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: weatherScreenProviderFalse!
              .weatherData(weatherScreenProviderTrue!.Name),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("${snapshot.error}");
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              WeatherModel? weatherModel = snapshot.data;
              return Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.network(
                      "https://pixabay.com/photos/cabin-countryside-storm-barn-rural-924958/",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 80,
                            ),
                            Container(
                              height: 80,
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              alignment: Alignment.center,
                              child: Text(
                                "${weatherModel!.location.name} ${weatherModel.location.region} , ${weatherModel.location.country}",
                                style: GoogleFonts.alice(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              alignment: Alignment.center,
                              child: Text(
                                "${weatherModel.current.tempC} °C",
                                style: GoogleFonts.alice(
                                  color: Colors.white,
                                  fontSize: 60,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Current Time     :-     ${weatherModel.location.localtime}",
                                    style: GoogleFonts.alice(
                                      color: Colors.white,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Last Update Time      :-     ${weatherModel.current.lastUpdated}",
                                    style: GoogleFonts.alice(
                                      color: Colors.white,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Wind Degree      :-     ${weatherModel.current.windDegree}",
                                    style: GoogleFonts.alice(
                                      color: Colors.white,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff1D213E),
                                Color(0xc3363f6a),
                                Color(0xc3363f6a),
                                Color(0xff1D213E),
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 50,
                                      width: 175,
                                      decoration: BoxDecoration(
                                        color: Color(0xff312D56),
                                        border: Border.all(
                                            color: Color(0xff4E3D73), width: 2),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Cloud",
                                        style: GoogleFonts.alice(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 50,
                                      width: 175,
                                      decoration: BoxDecoration(
                                        color: Color(0xff312D56),
                                        border: Border.all(
                                            color: Color(0xff4E3D73), width: 2),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${weatherModel.current.cloud}",
                                        style: GoogleFonts.alice(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 50,
                                      width: 175,
                                      decoration: BoxDecoration(
                                        color: Color(0xff312D56),
                                        border: Border.all(
                                            color: Color(0xff4E3D73), width: 2),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Wind Speed miter",
                                        style: GoogleFonts.alice(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 50,
                                      width: 175,
                                      decoration: BoxDecoration(
                                        color: Color(0xff312D56),
                                        border: Border.all(
                                            color: Color(0xff4E3D73), width: 2),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${weatherModel.current.windMph} m/h",
                                        style: GoogleFonts.alice(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 50,
                                      width: 175,
                                      decoration: BoxDecoration(
                                        color: Color(0xff312D56),
                                        border: Border.all(
                                            color: Color(0xff4E3D73), width: 2),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Wind Speed kilometer",
                                        style: GoogleFonts.alice(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 50,
                                      width: 175,
                                      decoration: BoxDecoration(
                                        color: Color(0xff312D56),
                                        border: Border.all(
                                            color: Color(0xff4E3D73), width: 2),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${weatherModel.current.windKph} km/h",
                                        style: GoogleFonts.alice(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      "Assets/Images/img_2.png",
                                      height: 100,
                                    ),
                                    Positioned(
                                      bottom: 15,
                                      left: 75,
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.pushNamed(context, 'add');
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
