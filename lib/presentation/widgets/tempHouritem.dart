import 'package:algoriza_task_3_weather_app/bloc/cubit.dart';
import 'package:algoriza_task_3_weather_app/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TempHourItem extends StatelessWidget {
  Map list ;
   TempHourItem({Key? key , required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit,WeatherStates>(
      listener: ( context, state) {  },
      builder: ( context, state) {
        WeatherCubit cubit = WeatherCubit.get(context);

        var l = list["time"];
        DateTime parseDate = DateFormat("yyyy-MM-dd' 'HH:mm").parse(l);
        var inputDate = DateTime.parse(parseDate.toString());
        var outputFormat = DateFormat('hh a');
        var outputDate = outputFormat.format(inputDate);
        return SizedBox(
          width: 65,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
              outputDate,
                style: GoogleFonts.getFont(
                  'Libre Franklin',
                  textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    color: Colors.white
                  ),
                ),
              ),
              Image(
                  image: NetworkImage(
                  'http:${list["condition"]["icon"]}'
              )),
              Text(
                '${(list["temp_c"] ).round()}\u2070',
                style: GoogleFonts.getFont(
                  'Libre Franklin',
                  textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                  ),
                ),
              ),
              const Spacer(),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   const Icon(
                     Icons.water_drop_rounded,
                     color: Colors.white,
                     size: 15,
                   ),
                   Text(
                    ' ${list['humidity']}%',
                     style: GoogleFonts.getFont(
                       'Libre Franklin',
                       textStyle: const TextStyle(
                           fontSize: 13,
                           fontWeight: FontWeight.w500,
                           color: Colors.white
                       ),
                     ),
              ),
                 ],
               ),
            ],
          ),
        );
      },
    );
  }
}
