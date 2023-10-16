
import 'dart:convert';

class NoteModel{
  final String title;
  final String content;
  final DateTime date;
  final String username;

  NoteModel({required this.title, required this.content, required this.date, required this.username,});

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      title: json['title'],
      content: json['content'],
      date: DateTime.parse(json['date'] as String),
      username: json['username'],
    );
  }

  NoteModel copyWith({String? title, String? content, DateTime? date, String? username,}) {
    return NoteModel(
      title: title ?? this.title,
      content: content ?? this.content,
      date: date ?? this.date,
      username: username?? this.username,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'date': date.toString(),
      'username': username,
    };
  }

  static String encode(List<NoteModel> objects) => json.encode(
    objects.map<Map<String, dynamic>>((obj) => obj.toJson()).toList(),
  );

  static List<NoteModel> decode(String objects) => objects.isEmpty ? [] :
  (json.decode(objects) as List<dynamic>)
      .map<NoteModel>((obj) => NoteModel.fromJson(obj)).toList();

}