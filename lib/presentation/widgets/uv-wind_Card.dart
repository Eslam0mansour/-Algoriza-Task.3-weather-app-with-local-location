import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cubit.dart';
import '../../bloc/states.dart';

class UvCard extends StatelessWidget {
  const UvCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<WeatherCubit,WeatherStates>(
        listener: (context, state) {},
        builder: (context, state) {
          WeatherCubit cubit = WeatherCubit.get(context);
          var list = WeatherCubit.get(context).fiveDaysData ;
          return Padding(
            padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 12,
                bottom: 2
            ),
            child: Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                color: cubit.appBarCollapsed? const Color(0xff171717) : Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/uv.png',
                        width: 70,
                      ),
                      const Text(
                        'UV index',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${list[0]['uv']}',
                        style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),

                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/wind.png',
                        width: 70,
                      ),
                      const Text(
                        'Wind',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${list[0]['wind_kph']} km/h',
                        style: const TextStyle(
                          fontSize: 19,
                          color: Colors.white,

                        ),

                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/humidity.png',
                        width: 70,
                      ),
                      const Text(
                        'humidity',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${list[0]['humidity']}%',
                        style: const TextStyle(
                          fontSize: 19,
                          color: Colors.white,

                        ),

                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
    );

  }
}
