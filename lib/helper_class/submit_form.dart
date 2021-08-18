class SubmitForm {
  String submitName;
  String nameTender;
  CreateDate createDate;
  double price;
  List<String> documents;

  SubmitForm(
      {this.submitName,
        this.nameTender,
        this.createDate,
        this.price,
        this.documents});

  SubmitForm.fromJson(Map<String, dynamic> json) {
    submitName = json['submitName'];
    nameTender = json['nameTender'];
    createDate = json['createDate'] != null
        ? new CreateDate.fromJson(json['createDate'])
        : null;
    price = json['price'];
    documents = json['documents'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['submitName'] = this.submitName;
    data['nameTender'] = this.nameTender;
    if (this.createDate != null) {
      data['createDate'] = this.createDate.toJson();
    }
    data['price'] = this.price;
    data['documents'] = this.documents;
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
