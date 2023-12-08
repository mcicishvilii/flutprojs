
import 'package:flutprojs/data/remote/misho_dto.dart';
import 'package:flutprojs/data/remote/yes_no_dto.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class YesNoService {
  Future<MishoDto> fetchYesOrNo() async {
    final response = await http.get(Uri.parse('https://mcicishvili.pythonanywhere.com/random_number'));
    if (response.statusCode == 200) {
      return MishoDto.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
