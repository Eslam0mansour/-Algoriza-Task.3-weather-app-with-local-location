import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../bloc/cubit.dart';
import '../../bloc/states.dart';

class FiveDayItem extends StatelessWidget {
  Map list5 ;

  FiveDayItem({Key? key, required this.list5}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit,WeatherStates>(
        listener: (context, state) {},
        builder: (context, state) {
          WeatherCubit cubit = WeatherCubit.get(context);
          var l = list5["date"];
          int max = (list5["day"]["maxtemp_c"]).round();
          int min = (list5["day"]["mintemp_c"]).round();
          DateTime parseDate = DateFormat("yyyy-MM-dd").parse(l);
          var inputDate = DateTime.parse(parseDate.toString());
          var outputFormat = DateFormat('EEEE');
          var outputDate = outputFormat.format(inputDate);
          return SizedBox(
            height: 50,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 120,
                      child: Text(
                        outputDate,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.water_drop_sharp,
                      color: Colors.white,
                      size: 17,
                    ),
                    Text(
                      ' ${list5["hour"][0]["humidity"]}%',
                      style: GoogleFonts.getFont(
                        'Libre Franklin',
                        textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Image.asset(
                        'assets/s.png',
                        height: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/m.png',
                        height: 20,
                      ),

                    ],
                  ),
                ),
                Text(
                  '${max.toString()}\u2070 ${min.toString()}\u2070',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}
