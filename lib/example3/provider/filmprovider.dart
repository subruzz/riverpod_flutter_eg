import 'package:flutter_riverpod_eg/example3/models/film.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Filmprovider extends StateNotifier<List<Film>> {
  Filmprovider() : super(sampleFilms);

  void update(Film film, bool isFav) {
    state = state
        .map((currentFilm) => currentFilm.id == film.id
            ? currentFilm.copyWith(isFav: isFav)
            : currentFilm)
        .toList();
  }
}

final favStatusProvider = StateProvider<FavStatus>((_) => FavStatus.all);
final allFilmsProvider =
    StateNotifierProvider<Filmprovider, List<Film>>((ref) => Filmprovider());
final favFilmsProvider = Provider<Iterable<Film>>(
  (ref) {
    return ref.watch(allFilmsProvider).where((e) => e.isFav);
  },
);
final notfavFilmsProvider = Provider<Iterable<Film>>(
  (ref) {
    return ref.watch(allFilmsProvider).where((e) => !e.isFav);
  },
);
