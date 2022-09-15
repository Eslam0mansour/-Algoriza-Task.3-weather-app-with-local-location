import 'package:algoriza_task_3_weather_app/bloc/cubit.dart';
import 'package:algoriza_task_3_weather_app/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class MYSilverAppbar extends StatelessWidget {
bool iscol ;
   MYSilverAppbar({Key? key ,required this.iscol }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit,WeatherStates>(
      listener: ( context, state) {  },
      builder: ( context, state) {
        WeatherCubit cubit = WeatherCubit.get(context) ;
        var now =  DateTime.now();
        var formatter =  DateFormat.E();
        return SliverAppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          pinned: true,
          snap: false,
          floating: true,
          primary: false,
          toolbarHeight: 200,
          expandedHeight: 320,
          automaticallyImplyLeading: false,
          flexibleSpace: FlexibleSpaceBar(
            expandedTitleScale: 1.2,
            titlePadding: iscol ? const EdgeInsets.only(
                top: 110,
              right: 20,
              left: 20
            )
                : const EdgeInsets.all(20 ),
            centerTitle: true,
            title: iscol ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${(cubit.fiveDaysDatacurant['temp_c'] ).round().toString()}\u2070',
                      style: const TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.w300,
                          color: Colors.white
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${(cubit.fiveDaysDataa[0]['day']['mintemp_c']).round()}\u2070 / ${(cubit.fiveDaysDataa[0]['day']['maxtemp_c'] ).round()}\u2070',
                          style: GoogleFonts.getFont(
                            'Libre Franklin',
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Text(
                          '${formatter.format(now)},  ${TimeOfDay.now().format(context)}',
                          style: GoogleFonts.getFont(
                            'Libre Franklin',
                            textStyle: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ],
                    ) ,
                    SizedBox(
                      width: 60,
                      child: Lottie.asset(
                        repeat: true,
                          frameRate: FrameRate.max,
                          (cubit.currentWeatherData.weather?[0].icon != null  ) ?
                          'assets/${(cubit.currentWeatherData.weather?[0].icon)}.json'
                              : 'assets/01d.json'                      ),
                    )
                  ],
                ),
                const Spacer(),
              ],
            ) :
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${(cubit.fiveDaysDatacurant['temp_c'] ).round().toString()}\u2070',
                      style: GoogleFonts.getFont(
                        'Libre Franklin',
                        textStyle: const TextStyle(
                          fontSize: 50,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: Lottie.asset(
                          reverse: true,
                          (cubit.currentWeatherData.weather?[0].icon != null  ) ?
                          'assets/${(cubit.currentWeatherData.weather?[0].icon)}.json'
                              : 'assets/01d.json'
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text('${(cubit.fiveDaysDatalocation['region'])}',
                      style: GoogleFonts.getFont(
                        'Libre Franklin',
                        textStyle: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const Icon(Icons.location_on,
                      color: Colors.white,
                      size: 21,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      '${(cubit.fiveDaysDataa[0]['day']['mintemp_c']).round()}\u2070 / ${(cubit.fiveDaysDataa[0]['day']['maxtemp_c'] ).round()}\u2070',
                      style: GoogleFonts.getFont(
                        'Libre Franklin',
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    Text(
                      ' Fells like ${(cubit.fiveDaysDatacurant['feelslike_c']).round()}\u2070',
                      style: GoogleFonts.getFont(
                        'Libre Franklin',
                        textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  '${formatter.format(now)}, ${TimeOfDay.now().format(context)}',
                  style: GoogleFonts.getFont(
                    'Libre Franklin',
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ],
            ),
            background: Container(
              color: iscol?  Colors.black :  Color(0xff66b2fa),
              alignment: Alignment.bottomLeft,
              // child: Text(
              //   (cubit.currentWeatherData.main != null) ?
              //   '${(cubit.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103'
              //       : '',
              //   style: TextStyle(
              //       fontSize: 50
              //   ),
              // ),
            ),
          ),
        );
      },
    );
  }
}
