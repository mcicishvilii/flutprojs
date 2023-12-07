class YesNoDto {
  final String answer;
  final bool forced;
  final String image;

  YesNoDto({required this.answer, required this.forced, required this.image});

  factory YesNoDto.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'answer': String answer,
      'forced': bool forced,
      'image': String image,
      } =>
          YesNoDto(
            answer: answer,
            forced: forced,
            image: image,
          ),
      _ => throw const FormatException('Failed to load yesno.'),
    };
  }
}
