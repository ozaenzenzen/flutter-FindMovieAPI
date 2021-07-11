class DetailsAPI {
  String title;
  String year;
  String rated;
  String released;
  String runtime;
  String genre;
  String director;
  String actors;
  String plots;
  String poster;

  DetailsAPI({
    this.title,
    this.year,
    this.rated,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.actors,
    this.plots,
    this.poster,
  });

  factory DetailsAPI.source(Map<String, dynamic> object) {
    return DetailsAPI(
      title: object['Title'],
      year: object['Year'],
      rated: object['Rated'],
      released: object['Released'],
      runtime: object['Runtime'],
      genre: object['Genre'],
      director: object['Director'],
      actors: object['Actors'],
      plots: object['Plot'],
      poster: object['Poster'],
    );
  }
}
