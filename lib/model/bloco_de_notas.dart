class BlocoDeNotas {
  final String id;
  final String title;
  String description;

  BlocoDeNotas({
    required this.id,
    required this.title,
    required this.description,
  });

  factory BlocoDeNotas.fromJson(Map<String, dynamic> json) {
    return BlocoDeNotas(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}
