class UserInformation {
  String userName;
  String email;
  String password;
  String name;
  Number number;
  String imgURL;
  Location location;
  String about;
  bool manager;
  int bank;
  CreateDate createDate;
  String directorName;

  UserInformation(
      {this.userName,
        this.email,
        this.password,
        this.name,
        this.number,
        this.imgURL,
        this.location,
        this.about,
        this.manager,
        this.bank,
        this.createDate,
        this.directorName});

  UserInformation.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    number =
    json['number'] != null ? new Number.fromJson(json['number']) : null;
    imgURL = json['imgURL'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    about = json['about'];
    manager = json['manager'];
    bank = json['bank'];
    createDate = json['createDate'] != null
        ? new CreateDate.fromJson(json['createDate'])
        : null;
    directorName = json['directorName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['name'] = this.name;
    if (this.number != null) {
      data['number'] = this.number.toJson();
    }
    data['imgURL'] = this.imgURL;
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    data['about'] = this.about;
    data['manager'] = this.manager;
    data['bank'] = this.bank;
    if (this.createDate != null) {
      data['createDate'] = this.createDate.toJson();
    }
    data['directorName'] = this.directorName;
    return data;
  }
}

class Number {
  String codeNumber;
  int phoneNumber;

  Number({this.codeNumber, this.phoneNumber});

  Number.fromJson(Map<String, dynamic> json) {
    codeNumber = json['codeNumber'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codeNumber'] = this.codeNumber;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}

class Location {
  String gLocation;
  String country;

  Location({this.gLocation, this.country});

  Location.fromJson(Map<String, dynamic> json) {
    gLocation = json['gLocation'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gLocation'] = this.gLocation;
    data['country'] = this.country;
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
