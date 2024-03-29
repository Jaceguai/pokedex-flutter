class NamedApiResource {
  final String name;
  final String url;

  NamedApiResource({
    required this.name,
    required this.url,
  });

  factory NamedApiResource.fromJson(Map<String, dynamic> json) {
    return NamedApiResource(
      name: json['name'],
      url: json['url'],
    );
  }
}