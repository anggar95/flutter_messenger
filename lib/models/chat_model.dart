class Chat {
  final String id;
  final String userA;
  final String userB;

  Chat({
    required this.id,
    required this.userA,
    required this.userB,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "userA": userA,
        "userB": userB,
      };
}
