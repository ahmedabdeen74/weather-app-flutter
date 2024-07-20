import 'package:weather_app/core/utils/assets.dart';

String weatherConditionImage(String weatherCondition) {
  weatherCondition = weatherCondition.toLowerCase().trim();
  switch (weatherCondition) {
    case "clear":
    case "sunny":
      return AssetsData.kSunny;
    case "partly cloudy":
    case "cloudy":
    case "overcast":
    case "mist":
    case "patchy rain possible":
    case "patchy snow possible":
    case "patchy sleet possible":
    case "patchy freezing drizzle possible":
    case "thundery outbreaks possible":
    case "blowing snow":
    case "blizzard":
    case "fog":
    case "freezing fog":
      return AssetsData.kCloudy;
    case "patchy light drizzle":
    case "light drizzle":
    case "freezing drizzle":
    case "heavy freezing drizzle":
    case "light freezing rain":
    case "moderate or heavy freezing rain":
    case "patchy light rain":
    case "light rain":
    case "moderate rain at times":
    case "moderate rain":
    case "heavy rain at times":
    case "heavy rain":
    case "light rain shower":
    case "moderate or heavy rain shower":
    case "torrential rain shower":
    case "light sleet":
    case "moderate or heavy sleet":
    case "patchy rain nearby":
      return AssetsData.kRain;
    case "patchy light snow":
    case "light snow":
    case "patchy moderate snow":
    case "moderate snow":
    case "patchy heavy snow":
    case "heavy snow":
      return AssetsData.kSnow;
    case "ice pellets":
    case "light showers of ice pellets":
    case "moderate or heavy showers of ice pellets":
      return "assets/animations/heavy snow.json";
    case "patchy light rain with thunder":
    case "moderate or heavy rain with thunder":
    case "patchy light snow with thunder":
    case "moderate or heavy snow with thunder":
      return AssetsData.kThunderStorm;
    default:
      return AssetsData.kCloudy;
  }
}