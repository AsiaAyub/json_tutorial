class User {
  int? id;
  String? name;
  String? userName;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  User(
      {required this.id,
      this.name,
      this.userName,
      this.email,
      required this.address,
      this.phone,
      this.website,
      this.company});

  User.fromJson(Map<String, dynamic> json) {
    print(json['address']);
    id = json['id'];
    name = json['name'];
    userName = json['username'];
    email = json['email'];
    address = Address.fromJson(json['address']);
    phone = json["phone"];
    website = json['website'];
    company = Company.fromJson(json['company']);
  }
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipCode;
  Geo? geo;

  Address(this.street, this.suite, this.city, this.zipCode, this.geo);

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    suite = json['suite'];
    city = json['city'];
    zipCode = json['zipcode'];
    geo = Geo.fromJson(json['geo']);
  }
}

class Geo {
  String? lat;
  String? lng;

  Geo({required this.lat, required this.lng});

  Geo.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }
}

List myList = ["M", "n", "f", 1];

Map<dynamic, dynamic> myMap = {1: "value1", 1.04: "Too long of a text "};

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    catchPhrase = json['catchPhrase'];
    bs = json['bs'];
  }
}
