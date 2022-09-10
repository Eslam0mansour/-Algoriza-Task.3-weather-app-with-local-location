import 'package:algoriza_task_3_weather_app/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubit.dart';
import '../../bloc/states.dart';

class ItemSearch extends StatelessWidget {
  Map list ;
   ItemSearch({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit,WeatherStates>(
        listener: (context, state) {},
        builder: (context, state) {
          WeatherCubit cubit = WeatherCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              padding: const EdgeInsets.all(15),
              child: InkWell(
                onTap: (){
                  // cubit.getCurrentWeatherData(lat: list['lat'], lon: list['lon']);
                  // cubit.getWeather(list['lat'], list['lon']);
                  cubit.getLocation(lat: list['lat'] , lon: list['lon'] );

                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Home(),
                  ),);
                  },
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                        '${list['name']}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),
                      ),
                      Text(
                        ' - ${list['country']}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),
                      ),
                      Text(
                        ' - ${list['state']}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
