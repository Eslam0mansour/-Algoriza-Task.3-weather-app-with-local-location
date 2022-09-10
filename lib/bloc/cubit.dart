import 'dart:async';
import 'package:algoriza_task_3_weather_app/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../service/Dio.dart';
import '../models/current_weather_data.dart';
import '../service/Dio2.dart';
import '../service/weather_service.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitialState());

  static WeatherCubit get(context) => BlocProvider.of(context);

  var searchController = TextEditingController();

     bool appBarCollapsed = false;
     ScrollController scrollController = ScrollController() ;

     bool isCollapsed() =>
         scrollController.hasClients && scrollController.offset > (146 - kToolbarHeight);
     void scroll(){
       scrollController = ScrollController()
         ..addListener(() {
           if (isCollapsed() && !appBarCollapsed) {
             appBarCollapsed = true;
             emit(GetScrollLoadingState());
           } else if (!isCollapsed() && appBarCollapsed) {
             appBarCollapsed = false;
             emit(GetScrollSuccessState());

           }
         });
  }


  late StreamSubscription<Position> streamSubscription;

    List<dynamic> fiveDaysData  = [];
    List<dynamic> fiveDaysDataa = [];

  CurrentWeatherData currentWeatherData = CurrentWeatherData();

  List<CurrentWeatherData> dataList = [];

  List<dynamic> search = [];
  void getSearch (String value) {
    emit(NewsGetSearchLoadingState());
    DioHelper2.getDate2(url: '/direct',
        query: {
          'q':'$value',
          'appid':'9b809541a93558274660a10e8bd76ed3',
          'limit' : '5'
        }
    ).then((value) {
      search = value.data;
      print(search);
      // getWeather(search[0]['lat'], search[0]['lon']);
      // getCurrentWeatherData(search[0]['lat'], search[0]['lon']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      emit(NewsGetSearchErrorState(error.toString()));
      print(error.toString());
    });
  }

  void getCurrentWeatherData( {
    double? lat , double? lon
}) {

    WeatherService(city: 'lat=$lat&lon=$lon').getCurrentWeatherData(
        onSuccess: (data) {
          currentWeatherData = data;
        },
        onError: (error) => {
          print(error),
        });
  }
  void getWeather({
    double? lat , double? lon
  }) {
    emit(GetWeatherLoadingState());
    DioHelper.getDate(url: '/forecast.json', query: {
      'key': 'ab8d913f03ab4d7dbe1102035220909',
      'q': '$lat,$lon',
      'days': '7',
      'aqi': 'no',
      'alerts': 'no',
    }).then((value) {
      fiveDaysData  = value.data["forecast"]["forecastday"][0]["hour"] ;
      fiveDaysDataa = value.data["forecast"]["forecastday"];
       print(fiveDaysData[0]["time"]);
       print(fiveDaysDataa[0]["date"]);
      emit(GetWeatherSuccessState());
    }).catchError((error) {
      emit(GetWeatherErrorState(error.toString()));
      print(error.toString());
    });
  }


  double? latitude ;
  double? longitude ;
  double? address  ;

  Future<void> getLocation({
  double? lat ,
    double? lon ,
}) async {
    bool serviceEnabled;

    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
           latitude= (lat??  position.latitude) as double?;
           longitude= (lon?? position.longitude) as double?;
          // getAddressFromLatLang(position);
           getCurrentWeatherData(lat: latitude as double,lon: longitude as double);
           getWeather(lat: latitude as double,lon:  longitude as double);
           print(latitude);
        });
  }

////////////////////////////////////////////////////////////////////////
// https://api.openweathermap.org/data/2.5/weather?q=Cairo&appid=9b809541a93558274660a10e8bd76ed3
// https://api.openweathermap.org/data/2.5/weather?
// q=Cairo&appid=9b809541a93558274660a10e8bd76ed3
//lat=37.4219983&lon=-122.084

}
