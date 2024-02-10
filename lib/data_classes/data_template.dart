class Template {
  bool success;
  Data data;
  Meta meta;

  Template({
    required this.success,
    required this.data,
    required this.meta,
  });

}

class Data<T> {
  T value;

  Data(this.value);

  T getValue() {
    return value;
  }
}

class Meta {
  Meta(this.statusCode, this.message);

  int statusCode;
  String message;
}