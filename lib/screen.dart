import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/apicudit.dart';
import 'package:flutter_application_1/apistate.dart';
import 'package:flutter_application_1/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayApp extends StatefulWidget {
  const DisplayApp({super.key});

  @override
  State<DisplayApp> createState() => _DisplayAppState();
}

class _DisplayAppState extends State<DisplayApp> {
  final APIBloc apiBloc = APIBloc();
  Widget weathercode(String weatherCode) {
    switch (weatherCode) {
      case "0":
        return Column(
          children: [Text("	Clear sky"), Icon(Icons.cloud)],
        );

      case "1":
        return Column(
          children: [
            Text("	Mainly clear, partly cloudy, and overcast"),
            Icon(
              Icons.cloud,
              color: Colors.blue,
            )
          ],
        );
      case "2":
        return Column(
          children: [
            Text("	Mainly clear, partly cloudy, and overcast"),
            Icon(
              Icons.cloud,
              color: Colors.blueAccent,
            )
          ],
        );
      case "3":
        return Column(
          children: [
            Text("	Mainly clear, partly cloudy, and overcast"),
            Icon(
              Icons.cloud,
              color: Colors.blueAccent,
            )
          ],
        );
      case "45":
        return Column(
          children: [
            Text("	Fog and depositing rime fog"),
            Icon(
              Icons.cloud,
              color: Colors.grey,
            )
          ],
        );
      case "48":
        return Column(
          children: [
            Text("	Fog and depositing rime fog"),
            Icon(
              Icons.cloud,
              color: Colors.grey,
            )
          ],
        );
      case "51":
        return Column(
          children: [
            Text("	Drizzle: Light, moderate, and dense intensity"),
            Icon(
              Icons.thunderstorm,
              color: const Color.fromARGB(255, 235, 201, 99),
            ),
          ],
        );
      case "53":
        return Column(
          children: [
            Text("	Drizzle: Light, moderate, and dense intensity"),
            Icon(
              Icons.thunderstorm,
              color: const Color.fromARGB(255, 235, 201, 99),
            ),
          ],
        );
      case "55":
        return Column(
          children: [
            Text("	Drizzle: Light, moderate, and dense intensity"),
            Icon(
              Icons.thunderstorm,
              color: const Color.fromARGB(255, 235, 201, 99),
            ),
          ],
        );
      case "56":
        return Column(
          children: [
            Text("	Freezing Drizzle: Light and dense intensity"),
            Icon(
              Icons.thunderstorm,
              color: Colors.grey,
            ),
          ],
        );
      case "57":
        return Column(
          children: [
            Text("	Freezing Drizzle: Light and dense intensity"),
            Icon(
              Icons.thunderstorm,
              color: Colors.grey,
            ),
          ],
        );
      case "61":
        return Column(
          children: [
            Text("	Rain: Slight, moderate and heavy intensity"),
            Icon(
              Icons.opacity,
              color: Colors.blueAccent,
            ),
          ],
        );
      case "63":
        return Column(
          children: [
            Text("	Rain: Slight, moderate and heavy intensity"),
            Icon(
              Icons.opacity,
              color: Colors.blueAccent,
            ),
          ],
        );

      case "65":
        return Column(
          children: [
            Text("	Rain: Slight, moderate and heavy intensity"),
            Icon(
              Icons.opacity,
              color: Colors.blueAccent,
            ),
          ],
        );
      case "66":
        return Column(
          children: [
            Text("	Freezing Rain: Light and heavy intensity	"),
            Icon(
              Icons.cloudy_snowing,
            ),
          ],
        );
      case "67":
        return Column(
          children: [
            Text("	Freezing Rain: Light and heavy intensity	"),
            Icon(
              Icons.cloudy_snowing,
            ),
          ],
        );
      case "71":
        return Column(
          children: [
            Text("	Snow fall: Slight, moderate, and heavy intensity"),
            Icon(
              Icons.snowing,
            ),
          ],
        );
      case "73":
        return Column(
          children: [
            Text("	Snow fall: Slight, moderate, and heavy intensity"),
            Icon(
              Icons.snowing,
            ),
          ],
        );
      case "75":
        return Column(
          children: [
            Text("	Snow fall: Slight, moderate, and heavy intensity"),
            Icon(
              Icons.snowing,
            ),
          ],
        );
      case "77":
        return Column(
          children: [
            Text("		Snow grains"),
            Icon(
              Icons.ac_unit,
            ),
          ],
        );
      case "80":
        return Column(
          children: [
            Text("	Rain showers: Slight, moderate, and violent"),
            Icon(
              Icons.severe_cold,
            ),
          ],
        );
      case "81":
        return Column(
          children: [
            Text("	Rain showers: Slight, moderate, and violent"),
            Icon(
              Icons.severe_cold,
            ),
          ],
        );
      case "82":
        return Column(
          children: [
            Text("	Rain showers: Slight, moderate, and violent"),
            Icon(
              Icons.severe_cold,
            ),
          ],
        );
      case "85":
        return Column(
          children: [
            Text("	Snow showers slight and heavy"),
            Icon(
              Icons.foggy,
            ),
          ],
        );
      case "86":
        return Column(
          children: [
            Text("	Snow showers slight and heavy"),
            Icon(
              Icons.foggy,
            ),
          ],
        );
      case "95":
        return Column(
          children: [
            Text("Thunderstorm: Slight or moderate"),
            Icon(
              Icons.cyclone,
            ),
          ],
        );
      case "96":
        return Column(
          children: [
            Text("Thunderstorm with slight and heavy hail"),
            Icon(
              Icons.cyclone,
            ),
          ],
        );
      case "99":
        return Column(
          children: [
            Text("Thunderstorm with slight and heavy hail"),
            Icon(
              Icons.cyclone,
            ),
          ],
        );
      default:
        return Text("no data");
    }
  }

  @override
  void initState() {
    apiBloc.add(GetAPI());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        backgroundColor: Colors.blueAccent,
      ),
      body: listAPI(),
    );
  }

  Widget listAPI() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (context) => apiBloc,
        child: BlocListener<APIBloc, APIState>(
          listener: (context, state) {
            if (state is APIError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<APIBloc, APIState>(
            builder: (context, state) {
              if (state is APIInitial) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is APILoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is APILoaded) {
                return APIDisplay(context, state.modelClass);
              } else if (state is APIError) {
                return Center(
                    child: Container(
                  child: const Text("ERROR"),
                ));
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget APIDisplay(BuildContext context, ModelClass model) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Current MaxTemperature',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: 5),
        Text("${model.current!.temperature2m.toString()}°C"),
        SizedBox(height: 10),
        Text(
          'Current weather description,',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: 5),
        weathercode(model.daily!.weathercode![3].toString()),
        SizedBox(height: 10),
        Text(
          '3-Day Forecast:',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: 10),
        forecast(
            model.daily!.time![4],
            model.daily!.temperature2mMax![4].toString(),
            model.daily!.weathercode![4].toString()),
        forecast(
            model.daily!.time![5],
            model.daily!.temperature2mMax![5].toString(),
            model.daily!.weathercode![5].toString()),
        forecast(
            model.daily!.time![6],
            model.daily!.temperature2mMax![6].toString(),
            model.daily!.weathercode![6].toString()),
      ],
    ));
  }

  Widget forecast(
    String date,
    String temp,
    String wwc,
  ) {
    return Row(
      children: [
        Text(
          date,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          "$temp °C",
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(
          width: 20,
        ),
        weathercode(wwc)
      ],
    );
  }
}
