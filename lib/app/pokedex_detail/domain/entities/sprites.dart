class Sprites {
  String? main;
  String? front;
  String? back;

  Sprites({this.main, this.front, this.back});

  Sprites copyWith({
    String? mainPicture,
    String? front,
    String? back,
  }) =>
      Sprites(
        main: mainPicture ?? this.main,
        front: front ?? this.front,
        back: back ?? this.back,
      );
}
