import 'package:algoriza_task_3_weather_app/presentation/widgets/tempHouritem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cubit.dart';
import '../../bloc/states.dart';

class TempHourCard extends StatelessWidget {
   const TempHourCard({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit,WeatherStates>(
        listener: (context, state) {},
        builder: (context, state) {
          WeatherCubit cubit = WeatherCubit.get(context);
          var list = WeatherCubit.get(context).fiveDaysData ;
          return Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 2,
              bottom: 2
            ),
            child: Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                color: cubit.appBarCollapsed? const Color(0xff171717) : Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(20),
              child: Center(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, int index) => TempHourItem(list: list[index],),
                  itemCount: list.length,
                ),
              ),
            ),
          );
        }
    );
  }
}
