import 'package:algoriza_task_3_weather_app/presentation/widgets/5daytempitem.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubit.dart';
import '../../bloc/states.dart';

class FiveDayTempCard extends StatelessWidget {
  bool iscol ;
   FiveDayTempCard({Key? key, required this.iscol}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit,WeatherStates>(
        listener: (context, state) {},
        builder: (context, state) {
          WeatherCubit cubit = WeatherCubit.get(context);
          var list = WeatherCubit.get(context).fiveDaysDataa ;
          return Padding(
            padding: const EdgeInsets.only(
                left: 12,
                right: 12,
                top: 15,
                bottom: 15
            ),
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: iscol? const Color(0xff171717) : Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                itemBuilder: (context, int index) => FiveDayItem(list5: list[index],),
                itemCount: list.length,
                padding: EdgeInsets.all(10),
              ),
            ),
          );
        }
    );
  }
}
