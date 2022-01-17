class Category {
  int id;
  String name;
  int status;
  String description;

  Category({
    required this.id,
    required this.name,
    required this.status,
    required this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        description: json['description'],
      );
}
