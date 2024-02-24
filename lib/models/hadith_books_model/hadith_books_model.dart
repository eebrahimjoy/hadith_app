class HadithBooks {
  int id;
  String title;
  String titleAr;
  int numberOfHadith;
  String abvrCode;
  String bookName;
  String colorCode;

  HadithBooks({
    required this.id,
    required this.title,
    required this.titleAr,
    required this.numberOfHadith,
    required this.abvrCode,
    required this.bookName,
    required this.colorCode,
  });

  factory HadithBooks.fromJson(Map<String, dynamic> json) {
    return HadithBooks(
      id: json['id'] as int,
      title: json['title'] as String,
      titleAr: json['title_ar'] as String,
      numberOfHadith: json['number_of_hadis'] as int,
      abvrCode: json['abvr_code'] as String,
      bookName: json['book_name'] as String,
      colorCode: json['color_code'] as String,
    );
  }
}
