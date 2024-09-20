import 'package:equatable/equatable.dart';

class Film extends Equatable {
  final String id;
  final String title;
  final String desc;
  final bool isFav;
  const Film(
      {required this.id,
      required this.title,
      required this.desc,
      required this.isFav});

  Film copyWith({
    String? id,
    String? title,
    String? desc,
    bool? isFav,
  }) {
    return Film(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      isFav: isFav ?? this.isFav,
    );
  }

  @override
  List<Object> get props => [id, title, desc, isFav];
}

enum FavStatus {
  all,
  favorite,
  notFavorite,
}

List<Film> sampleFilms = const [
  Film(
    id: '1',
    title: 'Inception',
    desc:
        'A skilled thief is given a chance at redemption if he can successfully infiltrate a target\'s subconscious.',
    isFav: false,
  ),
  Film(
    id: '2',
    title: 'The Dark Knight',
    desc:
        'When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.',
    isFav: false,
  ),
  Film(
    id: '3',
    title: 'Interstellar',
    desc:
        'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.',
    isFav: false,
  ),
  Film(
    id: '4',
    title: 'The Matrix',
    desc:
        'A computer hacker learns from mysterious rebels about the false nature of his reality and his role in the war against its controllers.',
    isFav: false,
  ),
  Film(
    id: '5',
    title: 'The Shawshank Redemption',
    desc:
        'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.',
    isFav: false,
  ),
  Film(
    id: '6',
    title: 'Pulp Fiction',
    desc:
        'The lives of two mob hitmen, a boxer, a gangster\'s wife, and a pair of diner bandits intertwine in four tales of violence and redemption.',
    isFav: false,
  ),
  Film(
    id: '7',
    title: 'Fight Club',
    desc:
        'An insomniac office worker forms an underground fight club with a soap maker.',
    isFav: false,
  ),
  Film(
    id: '8',
    title: 'Forrest Gump',
    desc:
        'The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal, and other historical events unfold through the perspective of an Alabama man.',
    isFav: false,
  ),
  Film(
    id: '9',
    title: 'The Godfather',
    desc:
        'An organized crime dynasty\'s aging patriarch transfers control of his clandestine empire to his reluctant son.',
    isFav: false,
  ),
  Film(
    id: '10',
    title: 'Gladiator',
    desc:
        'A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.',
    isFav: false,
  ),
];
