import 'package:algoriza_task_3_weather_app/presentation/widgets/5daytempcard.dart';
import 'package:algoriza_task_3_weather_app/presentation/widgets/TempHourCard.dart';
import 'package:algoriza_task_3_weather_app/presentation/widgets/sunriseandsetcard.dart';
import 'package:algoriza_task_3_weather_app/presentation/widgets/uv-wind_Card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/MyDrawer.dart';
import 'widgets/Silverappbar.dart';
import '../bloc/cubit.dart';
import '../bloc/states.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return BlocConsumer<WeatherCubit, WeatherStates>(
      listener: (context, state) {},
      builder: (context, state) {
        WeatherCubit cubit = WeatherCubit.get(context) ;
        // var list = WeatherCubit.get(context).Weather;
        if (cubit.currentWeatherData.name == null ) {
          return Container(color: Colors.blue ,child: const Center(child: CircularProgressIndicator(color: Colors.black54,)));
        } else {
          return Scaffold(
            backgroundColor: cubit.appBarCollapsed ? Colors.black : const Color(0xff66b2fa),
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: cubit.appBarCollapsed ? Row(
                children: [
                  Text(
                      '${(cubit.currentWeatherData.name)}',
                    style: GoogleFonts.getFont(
                      'Libre Franklin',
                      textStyle: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const Icon(Icons.location_on,
                    color: Colors.white,
                  size: 20,
                  )
                ],
              ) : const Text(''),
            ),
            drawer: const MyDrawer(),
            body: CustomScrollView(
              controller: cubit.scrollController,
              slivers: [
                MYSilverAppbar(),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TempHourCard(),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          right: 10,
                          left: 10,
                        ),
                        child: Container(
                          height: 110,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: cubit.appBarCollapsed?  Color(0xff171717) : Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(20),
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Today Temperature',
                                style: TextStyle(
                                    fontSize: 23, color: Colors.white),
                              ),
                              Text(
                                'Expect the same as yesterday',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey[200]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FiveDayTempCard(),
                      SunCard(),
                      UvCard(),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
