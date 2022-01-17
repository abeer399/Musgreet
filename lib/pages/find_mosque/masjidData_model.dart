// To parse this JSON data, do
//
//     final masjidData = masjidDataFromJson(jsonString);

import 'dart:convert';

List<MasjidData> masjidDataFromJson(String str) =>
    List<MasjidData>.from(json.decode(str).map((x) => MasjidData.fromJson(x)));

String masjidDataToJson(List<MasjidData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MasjidData {
  MasjidData({
    this.name,
    this.countryCity,
    this.address,
    this.longtitude,
    this.latitude,
    this.maleFemale,
    this.website,
    this.email,
    this.phoneNumber,
    this.madhabSect,
  });

  String name;
  String countryCity;
  String address;
  String longtitude;
  String latitude;
  String maleFemale;
  String website;
  String email;
  String phoneNumber;
  String madhabSect;

  factory MasjidData.fromJson(Map<String, dynamic> json) => MasjidData(
        name: json["Name"],
        countryCity: json["Country/City"],
        address: json["Address"],
        longtitude: json["Longtitude"],
        latitude: json["Latitude"],
        maleFemale: json["Male / Female"],
        website: json["Website"] == null ? null : json["Website"],
        email: json["Email"] == null ? null : json["Email"],
        phoneNumber: json["Phone number"],
        madhabSect:
            json["Madhab (Sect)"] == null ? null : json["Madhab (Sect)"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Country/City": countryCity,
        "Address": address,
        "Longtitude": longtitude,
        "Latitude": latitude,
        "Male / Female": maleFemale,
        "Website": website == null ? null : website,
        "Email": email == null ? null : email,
        "Phone number": phoneNumber,
        "Madhab (Sect)": madhabSect == null ? null : madhabSect,
      };
}
