class ActivityModel {
  final String id;
  final String title;
  final String description;
  final String category; // Ev, Dışarısı, Trend, Spor vb.
  final int participantCount; // Kişi sayısı
  final int minBudget; // Tahmini bütçe (TL)
  final int estimatedMinutes; // Süre
  final bool isCompleted;

  ActivityModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.participantCount,
    required this.minBudget,
    required this.estimatedMinutes,
    this.isCompleted = false,
  });

  // JSON'dan nesneye çevirme (Gemini API veya Veritabanı için)
  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      id: json['id'] as String? ?? DateTime.now().millisecondsSinceEpoch.toString(),
      title: json['title'] as String? ?? 'Aktivite',
      description: json['description'] as String? ?? '',
      category: json['category'] as String? ?? 'Genel',
      participantCount: json['participantCount'] as int? ?? 1,
      minBudget: json['minBudget'] as int? ?? 0,
      estimatedMinutes: json['estimatedMinutes'] as int? ?? 30,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }

  // Nesneden JSON'a çevirme
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'participantCount': participantCount,
      'minBudget': minBudget,
      'estimatedMinutes': estimatedMinutes,
      'isCompleted': isCompleted,
    };
  }
}