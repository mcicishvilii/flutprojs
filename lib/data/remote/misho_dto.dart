class MishoDto {
  final String result;
  MishoDto({required this.result});

  factory MishoDto.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'result': String result,
      } =>
          MishoDto(
            result: result,
          ),
      _ => throw const FormatException('Failed to load yesno.'),
    };
  }
}