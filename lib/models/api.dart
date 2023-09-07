abstract class JsonModel {
  JsonModel.fromJson(Map<String, dynamic> json) {
    throw Exception("Method should be overridden by children");
  }
  Map<String, dynamic> toJson() {
    throw Exception("Method should be overridden by children");
  }
}
