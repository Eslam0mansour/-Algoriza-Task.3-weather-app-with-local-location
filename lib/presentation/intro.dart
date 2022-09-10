import 'package:algoriza_task_3_weather_app/presentation/searchPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../bloc/cubit.dart';
import '../bloc/states.dart';
import 'home.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit,WeatherStates>(
      listener: ( context, state) {  },
      builder: ( context, state) {
        WeatherCubit cubit = WeatherCubit.get(context) ;
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    child: Lottie.asset(
                      'assets/plant.json',
                    ),
                  ),
                  Text(
                    'Welcom to Algoriza Weather App ',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'Here you can get the weather details from all of the world ',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      clipBehavior:Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MaterialButton(
                        color: Colors.teal[300],
                        height: 55,
                        minWidth: double.infinity,
                        onPressed: (){
                          cubit.getLocation();
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Home(),
                          ),);
                        },
                        child: const Text(
                          'Use your Current Location',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'OR',
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      clipBehavior:Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MaterialButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Search(),
                          ),);
                        },
                        color: Colors.teal[300],
                        height: 55,
                        minWidth: double.infinity,
                        child: const Text(
                          ' Use Different  Location ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
