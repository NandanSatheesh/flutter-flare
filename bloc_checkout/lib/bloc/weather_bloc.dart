import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc_checkout/model/weather.dart';

import 'bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  @override
  WeatherState get initialState => WeatherInitialState();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetWeather) {
      yield WeatherLoadingState();

      final weather = await _fetchWeatherFromApi(event.cityName);

      yield WeatherLoadedState(weather);
    }
  }

  _fetchWeatherFromApi(String cityName) {
    return Future.delayed(Duration(seconds: 2), () {
      return Weather(
          cityName: cityName,
          temperature: 20 + Random().nextInt(10) + Random().nextDouble());
    });
  }
}
