class HadithSections {
  int? chapterId;
  int? sectionId;
  String? title;
  String? preface;
  String? number;
  int? sortOrder;

  HadithSections({
    required this.chapterId,
    required this.sectionId,
    required this.title,
    required this.preface,
    required this.number,
    required this.sortOrder,
  });

  factory HadithSections.fromJson(Map<String, dynamic> json) {
    return HadithSections(
      chapterId: json['chapter_id'],
      sectionId: json['section_id'],
      title: json['title'],
      preface: json['preface'],
      number: json['number'],
      sortOrder: json['sort_order'],
    );
  }

}
