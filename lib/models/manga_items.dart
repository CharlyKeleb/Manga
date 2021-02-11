class AnimeItem {
  final String id;
  final String type;
  final String title;
  final dynamic description;
  final String averageRating;
  final String ageRatingGuide;
  final String posterImage;
  final String coverImage;
  final int episodeCount;
  final int episodeLenght;
  final String status;
  final int userCount;
  final int favouriateCount;
  final String startDate;
  final String endDate;
  final String youtubeId;

  AnimeItem({
    this.id,
    this.type,
    this.title,
    this.description,
    this.averageRating,
    this.ageRatingGuide,
    this.posterImage,
    this.coverImage,
    this.episodeCount,
    this.episodeLenght,
    this.status,
    this.userCount,
    this.favouriateCount,
    this.startDate,
    this.endDate,
    this.youtubeId,
  });

  AnimeItem.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        type = json['type'],
        title = json['attributes']['canonicalTitle'],
        description = json['attributes']['description'],
        averageRating = json['attributes']['averageRating'],
        ageRatingGuide = json['attributes']['ageRatingGuide'],
        posterImage = json['attributes']['posterImage']['small'],

        /// handling bug for no cover image items
        coverImage = json['attributes']['coverImage'] != null
            ? json['attributes']['coverImage']['original']
            : "",
        episodeCount = json['attributes']['episodeCount'],
        episodeLenght = json['attributes']['episodeLength'],
        status = json['attributes']['status'],
        userCount = json['attributes']['userCount'],
        favouriateCount = json['attributes']['favoritesCount'],
        startDate = json['attributes']['startDate'],
        endDate = json['attributes']['endDate'],
        youtubeId = json['attributes']['youtubeVideoId'];
}
