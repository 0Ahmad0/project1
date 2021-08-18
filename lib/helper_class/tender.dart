class Tender {
  String name;
  String nameCompany;
  List<String> document;
  CreateDate createDate;
  CreateDate startDate;
  CreateDate endDate;

  Tender(
      {this.name,
        this.nameCompany,
        this.document,
        this.createDate,
        this.startDate,
        this.endDate});

  Tender.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nameCompany = json['nameCompany'];
    document = json['document'].cast<String>();
    createDate = json['createDate'] != null
        ? new CreateDate.fromJson(json['createDate'])
        : null;
    startDate = json['startDate'] != null
        ? new CreateDate.fromJson(json['startDate'])
        : null;
    endDate = json['endDate'] != null
        ? new CreateDate.fromJson(json['endDate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['nameCompany'] = this.nameCompany;
    data['document'] = this.document;
    if (this.createDate != null) {
      data['createDate'] = this.createDate.toJson();
    }
    if (this.startDate != null) {
      data['startDate'] = this.startDate.toJson();
    }
    if (this.endDate != null) {
      data['endDate'] = this.endDate.toJson();
    }
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
