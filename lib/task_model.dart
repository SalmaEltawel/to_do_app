class TaskModel {
  String id;
  String title;
  String description;
  bool isDone;
  int date;

  TaskModel(
      {this.id = "",
      required this.title,
      required this.description,
      this.isDone = false,
      required this.date});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            title: json['title'],
            description: json['description'],
            date: json['date'],
            isDone: json['isDone']);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "description": description,
      "title": title,
      "date": date,
      "isDone": isDone
    };
  }
}
