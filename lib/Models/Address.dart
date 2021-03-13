import 'package:apiflutter/Models/Geo.dart';

class Address{

  Address();

  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;


  factory Address.fromJson(Map<String,dynamic> json) {
    return Address()
      ..street = json['street'] as String
        ..suite = json['suite'] as String
        ..city = json['city'] as String
        ..zipcode = json['zipcode'] as String
        ..geo = json['geo'] as Geo;
  }

  Map<String, dynamic> toJson(Address instance) => <String, dynamic> {
    "street": instance.street,
    "suite":instance.suite,
    "city": instance.city,
    "zipcode":instance.zipcode,
    "geo": instance.geo
  };
}