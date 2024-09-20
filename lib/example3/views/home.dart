import 'package:flutter/material.dart';
import 'package:flutter_riverpod_eg/example3/provider/filmprovider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/film.dart';

class Ex3Home extends StatelessWidget {
  const Ex3Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ex3'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Filter(),
            const SizedBox(
              height: 10,
            ),
            Consumer(
              builder: (context, ref, child) {
                final filter = ref.watch(favStatusProvider);
                switch (filter) {
                  case FavStatus.all:
                    return FilmsWidget(allFilmsProvider);
                  case FavStatus.favorite:
                    return FilmsWidget(favFilmsProvider);
                  case FavStatus.notFavorite:
                    return FilmsWidget(notfavFilmsProvider);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final currentStatus = ref.watch(favStatusProvider);

        return DropdownButton<FavStatus>(
          value: currentStatus,
          items: FavStatus.values.map((status) {
            return DropdownMenuItem<FavStatus>(
              value: status, // Set the value here
              child: Text(status.name),
            );
          }).toList(),
          onChanged: (val) {
            if (val != null) {
              ref.read(favStatusProvider.notifier).state = val;
            }
          },
        );
      },
    );
  }
}

class FilmsWidget extends ConsumerWidget {
  final AlwaysAliveProviderBase<Iterable<Film>> provider;
  const FilmsWidget(this.provider, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final films = ref.watch(provider);
    return Expanded(
        child: ListView.builder(
      itemCount: films.length,
      itemBuilder: (context, index) {
        final film = films.elementAt(index);
        final favIcon = film.isFav
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border);
        return ListTile(
          title: Text(film.title),
          subtitle: Text(film.desc),
          trailing: IconButton(
              onPressed: () {
                final isFav = !film.isFav;
                ref.read(allFilmsProvider.notifier).update(film, isFav);
              },
              icon: favIcon),
        );
      },
    ));
  }
}
