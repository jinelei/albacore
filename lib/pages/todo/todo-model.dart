class TodoModel {
  int id;
  String name;
  String description;
  bool finished;
  DateTime startTime;
  DateTime endTime;

  TodoModel(this.name, this.description, {this.id, this.finished, this.startTime, this.endTime});

  TodoModel.fromJson(Map<String, dynamic> json)
    :id = json["id"],
    name =json["name"],
    description = json["description"],
    finished = json["finished"] as bool,
    startTime = json['start_time'] is int
            ? new DateTime.fromMillisecondsSinceEpoch(json['start_time'])
            : new DateTime.now(),
        endTime = json['end_time'] is int
            ? new DateTime.fromMillisecondsSinceEpoch(json['end_time'])
            : new DateTime.now() {
    print("TodoModel{id: $id, name: $name, description: $description, finished: $finished, startTime: $startTime, endTime:$endTime}");
  }
    

  @override
  String toString() {
    return "TodoModel{id: $id, name: $name, description: $description, finished: $finished, startTime: $startTime, endTime:$endTime}";
  }

}