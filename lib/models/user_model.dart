class AppUser {
  final String id;
  final String name;
  final String avatar;

  AppUser({
    required this.id,
    required this.name,
    required this.avatar,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "avatar": avatar,
      };
}
