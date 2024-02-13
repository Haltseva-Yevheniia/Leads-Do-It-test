class RepositoryModel {
  final int id;
  final String name;

  const RepositoryModel({required this.name, required this.id});

  factory RepositoryModel.fromJson(Map<String, dynamic> json) =>
      RepositoryModel(name: json['name'], id: json['id']);
}
