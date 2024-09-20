enum City { stockholm, paris, tokyo }

typedef WeatherEmoji = String;

Future<WeatherEmoji> getWeather(City city) async {
  await Future.delayed(
    const Duration(seconds: 4),
  );

  final weatherEmojis = {
    City.stockholm: '🔥',
    City.paris: '⛈️',
    City.tokyo: '😶‍🌫️',
  };

  return weatherEmojis[city]!;
}
