class HadithDetails {
  String? bookName;
  int? chapterId;
  int? sectionId;
  int? hadithId;
  String? hadithKey;
  String? narrator;
  String? bn;
  String? ar;
  String? arDiacless;
  int? gradeId;
  String? grade;
  String? gradeColor;
  String? note;

  HadithDetails({
    required this.bookName,
    required this.chapterId,
    required this.sectionId,
    required this.hadithId,
    required this.hadithKey,
    required this.narrator,
    required this.bn,
    required this.ar,
    required this.arDiacless,
    required this.gradeId,
    required this.grade,
    required this.gradeColor,
    required this.note,
  });

  factory HadithDetails.fromJson(Map<String, dynamic> json) {
    return HadithDetails(
      bookName: json['book_name'],
      chapterId: json['chapter_id'],
      sectionId: json['section_id'],
      hadithId: json['hadith_id'],
      hadithKey: json['hadith_key'],
      narrator: json['narrator'],
      bn: json['bn'],
      ar: json['ar'],
      arDiacless: json['ar_diacless'],
      gradeId: json['grade_id'],
      grade: json['grade'],
      gradeColor: json['grade_color'],
      note: json['note'],
    );
  }

}
