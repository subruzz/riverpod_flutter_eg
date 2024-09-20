import 'package:flutter_riverpod_eg/example1_basics/helper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentDateProvider = Provider<DateTime>((ref) => DateTime.now());

class Counter extends StateNotifier<int?> {
  Counter() : super(null);
  void increment() {
    state = state == null ? 1 : state! + 1;
  }

  void clear() {
    state = null;
  }

  int? get value => state;
}

final counterProvider = StateNotifierProvider<Counter, int?>(
  (ref) => Counter(),
);

final weatherProvider = FutureProvider<WeatherEmoji>((ref) async {
  final city = ref.watch(currentCityProvider);
  if (city == null) return 'NO DATA';
  final res = await getWeather(city);
  return res;
});
final currentCityProvider = StateProvider<City?>((ref) => null);

final tickerProvider = StreamProvider<int>(
  (ref) {
    return Stream.periodic(const Duration(microseconds: 2), (i) => i + 1);
  },
);
