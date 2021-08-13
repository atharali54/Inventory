// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
  Model({
    this.status,
    this.statusCode,
    this.version,
    this.lastModified,
    this.access,
    this.total,
    this.data,
  });

  String status;
  int statusCode;
  String version;
  String lastModified;
  String access;
  int total;
  List<Datum> data;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        status: json["status"],
        statusCode: json["status-code"],
        version: json["version"],
        lastModified: json["last-modified"],
        access: json["access"],
        total: json["total"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "status-code": statusCode,
        "version": version,
        "last-modified": lastModified,
        "access": access,
        "total": total,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.team,
    this.teamFull,
    this.host,
    this.establishment,
    this.address,
    this.country,
    this.email,
    this.phone,
    this.fax,
    this.phoneEmergency,
    this.timezone,
    this.timezoneDst,
    this.constituency,
    this.constituencyDescription,
    this.memberSince,
    this.lastModified,
    this.website,
    this.otherCommunication,
    this.operatingHours,
    this.countryOther,
  });

  String id;
  String team;
  String teamFull;
  String host;
  String establishment;
  String address;
  String country;
  String email;
  List<String> phone;
  String fax;
  String phoneEmergency;
  String timezone;
  String timezoneDst;
  String constituency;
  String constituencyDescription;
  String memberSince;
  String lastModified;
  List<String> website;
  String otherCommunication;
  String operatingHours;
  List<String> countryOther;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        team: json["team"],
        teamFull: json["team-full"],
        host: json["host"] == null ? null : json["host"],
        establishment:
            json["establishment"] == null ? null : json["establishment"],
        address: json["address"] == null ? null : json["address"],
        country: json["country"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null
            ? null
            : List<String>.from(json["phone"].map((x) => x)),
        fax: json["fax"] == null ? null : json["fax"],
        phoneEmergency:
            json["phone-emergency"] == null ? null : json["phone-emergency"],
        timezone: json["timezone"],
        timezoneDst: json["timezone-dst"] == null ? null : json["timezone-dst"],
        constituency:
            json["constituency"] == null ? null : json["constituency"],
        constituencyDescription: json["constituency-description"] == null
            ? null
            : json["constituency-description"],
        memberSince: json["member-since"] == null ? null : json["member-since"],
        lastModified: json["last-modified"],
        website: json["website"] == null
            ? null
            : List<String>.from(json["website"].map((x) => x)),
        otherCommunication: json["other-communication"] == null
            ? null
            : json["other-communication"],
        operatingHours:
            json["operating-hours"] == null ? null : json["operating-hours"],
        countryOther: json["country-other"] == null
            ? null
            : List<String>.from(json["country-other"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "team": team,
        "team-full": teamFull,
        "host": host == null ? null : host,
        "establishment": establishment == null ? null : establishment,
        "address": address == null ? null : address,
        "country": country,
        "email": email == null ? null : email,
        "phone": phone == null ? null : List<dynamic>.from(phone.map((x) => x)),
        "fax": fax == null ? null : fax,
        "phone-emergency": phoneEmergency == null ? null : phoneEmergency,
        "timezone": timezone,
        "timezone-dst": timezoneDst == null ? null : timezoneDst,
        "constituency": constituency == null ? null : constituency,
        "constituency-description":
            constituencyDescription == null ? null : constituencyDescription,
        "member-since": memberSince == null ? null : memberSince,
        "last-modified": lastModified,
        "website":
            website == null ? null : List<dynamic>.from(website.map((x) => x)),
        "other-communication":
            otherCommunication == null ? null : otherCommunication,
        "operating-hours": operatingHours == null ? null : operatingHours,
        "country-other": countryOther == null
            ? null
            : List<dynamic>.from(countryOther.map((x) => x)),
      };
}
