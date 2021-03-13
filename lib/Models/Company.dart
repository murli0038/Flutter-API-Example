class Company{
  Company();

  String name;
  String catchPhrase;
  String bs;


  factory Company.fromJson(Map<String,dynamic> json) {
    return Company()
      ..name = json['name'] as String
        ..catchPhrase = json['catchPhrase'] as String
        ..bs = json['bs'] as String;
  }

  Map<String, dynamic> toJson(Company instance) => <String, dynamic> {
    "name":instance.name,
    "catchPhrase":instance.catchPhrase,
    "bs": instance.bs
  };
}