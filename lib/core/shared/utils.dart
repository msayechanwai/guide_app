String stringFromJson(Object? json) {
  return (json as String?) ?? '';
}

int intFromJson(dynamic json) => json is String ? int.parse(json) : json.toInt();

double doubleFromJson(dynamic json) => json is String ? double.parse(json) : json.toDouble();

DateTime dateTimeFromJson(dynamic json) => DateTime.parse(json as String);

List<String> listStringFromJson(dynamic json) =>
    (json as List<dynamic>).map((e) => e as String).toList();
