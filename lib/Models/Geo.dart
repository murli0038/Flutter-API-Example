class Geo{
  Geo();

  String lat;
  String lng;

  factory Geo.fromJson(Map<String,dynamic> json) {
    return Geo()
      ..lat = json['lat'] as String
        ..lng = json['lng'] as String;
  }
  Map<String, dynamic> toJson(Geo instance) => <String, dynamic> {
    "lat": instance.lat,
    "lng": instance.lng
  };

}