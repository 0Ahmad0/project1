class Committees {
  String type;
  CreateDate createDate;
  String manager;
  List<String> members;

  Committees({this.type, this.createDate, this.manager, this.members});

  Committees.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    createDate = json['createDate'] != null
        ? new CreateDate.fromJson(json['createDate'])
        : null;
    manager = json['manager'];
    members = json['members'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.createDate != null) {
      data['createDate'] = this.createDate.toJson();
    }
    data['manager'] = this.manager;
    data['members'] = this.members;
    return data;
  }
}

class CreateDate {
  int day;
  int month;
  int year;

  CreateDate({this.day, this.month, this.year});

  CreateDate.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    month = json['month'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['month'] = this.month;
    data['year'] = this.year;
    return data;
  }
}
