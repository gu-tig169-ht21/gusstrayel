import 'package:http/http.dart' as http;
import "./model.dart";
import "dart:convert";

const apiKey = 'daa266dd-fc5b-4fc7-a210-044ce833fe65';

class InternetFetcher {
  static Future getTasks() async {
    var response = await http.get(Uri.parse(
        "https://todoapp-api-pyq5q.ondigitalocean.app/todos?key=$apiKey"));
    String bodyString = response.body;
    var json = jsonDecode(bodyString);

    return json.map<Task>((data) {
      return Task.fromJson(data);
    }).toList();
  }

  static Future<List<Task>> addTask(Task todo) async {
    Map<String, dynamic> json = Task.toJson(todo);
    var bodyString = jsonEncode(json);
    print(bodyString);
    var response = await http.post(
      Uri.parse(
          'https://todoapp-api-pyq5q.ondigitalocean.app/todos?key=$apiKey'),
      body: bodyString,
      headers: {"Content-Type": "application/json"},
    );
    bodyString = response.body;
    var list = jsonDecode(bodyString);
    return list.map<Task>((data) {
      return Task.fromJson(data);
    }).toList();
  }

  static Future putTask(Task todo) async {
    Map<String, dynamic> json = Task.toJson(todo);
    var bodyString = jsonEncode(json);
    var todoID = todo.id;
    var response = await http.put(
      Uri.parse(
          "https://todoapp-api-pyq5q.ondigitalocean.app/todos/id?key=$apiKey"),
      body: bodyString,
      headers: {"Content-Type": "application/json"},
    );
    bodyString = response.body;
    var list = jsonDecode(bodyString);

    print(bodyString);
    print(todoID);
    return list.map<Task>((data) {
      return Task.fromJson(data);
    }).toList();
  }

  static Future deleteTask(String id) async {
    var response = await http.delete(Uri.parse(
        "https://todoapp-api-pyq5q.ondigitalocean.app/todos/:id?key=$apiKey"));
    var bodyString = response.body;
    var list = jsonDecode(bodyString);
    print(bodyString);
    print(id);
    return list.map<Task>((data) {
      return Task.fromJson(data);
    }).toList();
  }
}
