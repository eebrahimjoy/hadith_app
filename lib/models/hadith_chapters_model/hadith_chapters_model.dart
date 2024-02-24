class HadithChapters {
  int id;
  int chapterId;
  int bookId;
  String title;
  int number;
  String hadisRange;
  String bookName;

  HadithChapters({
    required this.id,
    required this.chapterId,
    required this.bookId,
    required this.title,
    required this.number,
    required this.hadisRange,
    required this.bookName,
  });

  factory HadithChapters.fromJson(Map<String, dynamic> json) {
    return HadithChapters(
      id: json['id'],
      chapterId: json['chapter_id'],
      bookId: json['book_id'],
      title: json['title'],
      number: json['number'],
      hadisRange: json['hadis_range'],
      bookName: json['book_name'],
    );
  }

}
