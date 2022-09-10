abstract class WeatherStates {}

class WeatherInitialState extends WeatherStates {}

class GetWeatherLoadingState extends WeatherStates {}

class GetWeatherSuccessState extends WeatherStates {}

class GetWeatherErrorState extends WeatherStates {
  final String error ;
  GetWeatherErrorState(this.error);
}

class GetWeather5LoadingState extends WeatherStates {}

class GetWeather5SuccessState extends WeatherStates {}

class GetWeather5ErrorState extends WeatherStates {
  final String error ;
  GetWeather5ErrorState(this.error);
}
class GetScrollLoadingState extends WeatherStates {}

class GetScrollSuccessState extends WeatherStates {}

class GetScrollErrorState extends WeatherStates {
  final String error ;
  GetScrollErrorState(this.error);
}
class NewsGetSearchLoadingState extends WeatherStates {}

class NewsGetSearchSuccessState extends WeatherStates {}

class NewsGetSearchErrorState extends WeatherStates {
  final String error ;
  NewsGetSearchErrorState(this.error);
}
class NewsGetlatlonLoadingState extends WeatherStates {}

class NewsGetlatlonSuccessState extends WeatherStates {}

class NewsGetlatlonErrorState extends WeatherStates {
  final String error ;
  NewsGetlatlonErrorState(this.error);
}