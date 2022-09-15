import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubit.dart';
import '../../bloc/states.dart';

class SunCard extends StatelessWidget {
  bool iscol ;
   SunCard({Key? key, required this.iscol}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<WeatherCubit,WeatherStates>(
        listener: (context, state) {},
        builder: (context, state) {
          WeatherCubit cubit = WeatherCubit.get(context);
          var list = WeatherCubit.get(context).fiveDaysDataa ;
          return Padding(
            padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 2,
                bottom: 2
            ),
            child: Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                color: iscol ? const Color(0xff171717) : Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Text(
                          'Sunrise',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                          '${list[0]['astro']['sunrise']}',
                        style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),

                      ),
                      Image.asset(
                        'assets/sunrise.png',
                        width: 80,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: [
                      const Text(
                          'Sunset',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                          '${list[0]['astro']['sunset']}',
                        style: const TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                          fontWeight: FontWeight.w600,

                        ),

                      ),
                      Image.asset(
                        'assets/sunset.png',
                        width: 80,
                      )
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
