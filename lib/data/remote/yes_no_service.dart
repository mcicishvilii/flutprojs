// import 'dart:convert';
//
// import 'package:flutprojs/data/remote/yes_no_dto.dart';
// import 'package:http/http.dart' as http;
//
// class YesNoService {
//   static const String apiUrl = 'https://yesno.wtf/api';
//
//   Future<YesNoDto> fetchYesOrNo() async {
//     final response = await http.get(Uri.parse(apiUrl));
//     if (response.statusCode == 200) {
//       return YesNoDto.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }
