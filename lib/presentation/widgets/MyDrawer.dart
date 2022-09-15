import 'package:algoriza_task_3_weather_app/presentation/searchPage.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../bloc/cubit.dart';
import '../../bloc/states.dart';
import '../intro.dart';
import 'Mysprator.dart';
import 'itemSerarch.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit,WeatherStates>(
        listener: (context, state) {},
        builder: (context, state) {
          WeatherCubit cubit = WeatherCubit.get(context);
          var list = WeatherCubit.get(context).fiveDaysDataa ;
          return SafeArea(
            child: Drawer(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(65)
              ),
              backgroundColor: const Color(0xff2D3741),
              elevation: 0,
              child: Column(
                children:   [
                  const Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Icon(
                          Icons.stars_sharp,
                          color: Colors.white,
                        ),
                        Text(
                          'Favourite location',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                        Icon(
                          Icons.info_outline,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                            color: Colors.white,
                            size: 18,
                          ),
                          Text(
                            '${(cubit.fiveDaysDatalocation['region'])}',                            style: const TextStyle(
                                fontSize: 21,
                                color: Colors.white,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.orangeAccent,
                        radius: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text(
                          (cubit.currentWeatherData.main != null) ?
                          ' ${(cubit.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2070'
                              : '',
                          style: GoogleFonts.getFont(
                            'Libre Franklin',
                            textStyle: const TextStyle(
                              color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    '....................................................',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:  const [
                        Icon(
                          Icons.add_location_outlined,
                          color: Colors.white,
                          size: 27,
                        ),
                        Text(
                          '    other locations',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),

                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Intro() ,
                          ),
                        );
                      },
                      child:const Text(
                        'Search for any location ',
                        style: TextStyle(
                          fontSize: 18
                        ),
                      )
                  ),
                  const Text(
                    '....................................................',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:  const [
                        Icon(
                          Icons.info_outline,
                          color: Colors.white,
                          size: 27,
                        ),
                        Text(
                          '    Report wrong locations',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:  const [
                        Icon(
                          Icons.headphones_outlined,
                          color: Colors.white,
                          size: 27,
                        ),
                        Text(
                          '    Contact us',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
