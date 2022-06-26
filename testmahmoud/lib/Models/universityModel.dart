class UniversityModel {
  String? code;
  String? message;
  List<UniversityData> universityData = [];
  UniversityModel.fromjeson({required Map<String, dynamic> data}) {
    code = data['code'];
    message = data['message'];
    data['data'].forEach((element) {
      UniversityData item = UniversityData.fromjeson(data: element);
      universityData.add(item);
    });
  }
}

class UniversityData {
  int? id;
  String? name;
  UniversityData.fromjeson({required Map<String, dynamic> data}) {
    id = data['id'];
    name = data['name'];
  }
}
