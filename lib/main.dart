import 'package:algoriza_task_3_weather_app/bloc/cubit.dart';
import 'package:algoriza_task_3_weather_app/presentation/home.dart';
import 'package:algoriza_task_3_weather_app/presentation/intro.dart';
import 'package:algoriza_task_3_weather_app/presentation/searchPage.dart';
import 'package:algoriza_task_3_weather_app/service/Dio2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/observer.dart';
import 'service/Dio.dart';
import 'bloc/states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await DioHelper2.init2();
  BlocOverrides.runZoned(
        () {
      runApp( MyApp());
    },
      blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // https://api.openweathermap.org/data/2.5/weather?q=Cairo&appid=9b809541a93558274660a10e8bd76ed3
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => WeatherCubit()..getLocation(),)
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Intro(),
      ),
    );
  }
}

