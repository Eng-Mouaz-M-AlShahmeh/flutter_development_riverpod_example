/* Developed by: Eng Mouaz M. Al-Shahmeh */
class TodoModel {
  int? id;
  String? title;
  String? dsc;

  TodoModel({
    this.id,
    this.title,
    this.dsc
  });

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'].toString();
    dsc = json['dsc'].toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['dsc'] = dsc;
    return data;
  }
}