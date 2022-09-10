import '/api/api_repository.dart';
import '/models/current_weather_data.dart';
import '/models/five_days_data.dart';

class WeatherService {
  final String city;

  String baseUrl = 'https://api.openweathermap.org/data/2.5';
  String apiKey = 'appid=9b809541a93558274660a10e8bd76ed3';


  WeatherService({required this.city});

  void getCurrentWeatherData({
    Function()? beforSend,
    Function(CurrentWeatherData currentWeatherData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
//https://api.openweathermap.org/data/2.5/weather?
// lat=37.4219983&lon=-122.084&appid=9b809541a93558274660a10e8bd76ed3
    final url = '$baseUrl/weather?$city&lang=en&$apiKey';
    ApiRepository(
      url: '$url',
    ).get(
        beforeSend: () => {
              if (beforSend != null)
                {
                  beforSend(),
                },
            },
        onSuccess: (data) => {
              onSuccess!(CurrentWeatherData.fromJson(data)),
            },
        onError: (error) => {
              if (onError != null)
                {
                  print(error),
                  onError(error),
                }
            });
  }

  void getFiveDaysThreeHoursForcastData({
    Function()? beforSend,
    Function(List<FiveDayData> fiveDayData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = '$baseUrl/forecast?q=$city&lang=en&$apiKey';
    print(url);
    ApiRepository(
      url: '$url',
    ).get(
        beforeSend: () => {},
        onSuccess: (data) => {
              onSuccess!((data['list'] as List)
                  .map((t) => FiveDayData.fromJson(t))
                  .toList())
            },
        onError: (error) => {
              print(error),
              onError!(error),
            });
  }
}
