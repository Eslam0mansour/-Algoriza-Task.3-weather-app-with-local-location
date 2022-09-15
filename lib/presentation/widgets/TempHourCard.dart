import 'package:algoriza_task_3_weather_app/presentation/widgets/tempHouritem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import '../../bloc/cubit.dart';
import '../../bloc/states.dart';

class TempHourCard extends StatelessWidget {
  bool iscol ;
    TempHourCard({Key? key,required this.iscol}) : super(key: key);

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
                color: iscol? const Color(0xff171717) : Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(20),
                child: Stack(
                  alignment: Alignment(0.0, 0.6),
                  children: [
                    SizedBox(
                      height: 47,
                      child: SfSparkLineChart(
                        color: Colors.white,
                        trackball: SparkChartTrackball(
                            width: 2,
                            backgroundColor: Colors.black12.withOpacity(0.5),
                            borderWidth: 1,
                            tooltipFormatter: (details) => " ${details.label}°C",
                            hideDelay: 1,
                            borderColor: Colors.white,
                            activationMode: SparkChartActivationMode.longPress),
                        marker: const SparkChartMarker(
                            size: 3, displayMode: SparkChartMarkerDisplayMode.all),
                        axisLineColor: Colors.transparent,
                        data: List.generate(24, (index) => list[index]['temp_c']),
                      ),
                    ),
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, int index) => TempHourItem(list: list[index],),
                      itemCount: list.length,
                    ),
                  ],
                ),

            ),
          );
        }
    );
  }
}
