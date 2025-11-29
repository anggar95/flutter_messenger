class Message {
  final String id;
  final String senderId;
  final String text;
  final String? imageUrl;
  final DateTime timestamp;

  Message({
    required this.id,
    required this.senderId,
    required this.text,
    this.imageUrl,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "senderId": senderId,
        "text": text,
        "imageUrl": imageUrl,
        "timestamp": timestamp.millisecondsSinceEpoch,
      };

  static Message fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        senderId: json["senderId"],
        text: json["text"],
        imageUrl: json["imageUrl"],
        timestamp:
            DateTime.fromMillisecondsSinceEpoch(json["timestamp"]),
      );
}
