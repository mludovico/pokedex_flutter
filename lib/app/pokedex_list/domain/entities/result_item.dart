class ResultItem {
  String? name;
  String? url;

  ResultItem({this.name, this.url});

  ResultItem copyWith(String? name, String? url) => ResultItem(
        name: name ?? this.name,
        url: url ?? this.url,
      );
}
